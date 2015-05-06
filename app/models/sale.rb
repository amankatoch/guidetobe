class Sale < ActiveRecord::Base
  include AASM
  has_paper_trail
  before_create :populate_guid

  belongs_to :owner
  belongs_to :product

  def self.finished
    where(state: 'finished')
  end

  def self.recent
    order('created_at')
  end

  aasm column: 'state' do
    state :pending, initial: true
    state :processing
    state :finished
    state :errored

    event :process, after: :charge_card do
      transitions from: :pending, to: :processing
    end

    event :finish, after: :create_subscription do
      transitions from: :processing, to: :finished
    end

    event :fail do
      transitions from: :processing, to: :errored
    end
  end

  def charge_card
    begin
      save!
      charge = Stripe::Charge.create(
        amount: self.fee_amount,
        currency: 'gbp',
        card: self.stripe_token,
        description: self.email
      )
      self.update(
        stripe_id:        charge.id,
        card_expiration:  Date.new(charge.card.exp_year, charge.card.exp_month, 1),
        fee_amount:       charge.amount
      )
      self.finish!

      # send an email to the new owner
      OwnerMailer.upgrade(self.owner).deliver
      Owner.downgrade_subscription_reminder(self.owner)
    rescue Stripe::CardError => e
      self.update_attributes(error: e.message)
      self.fail!
    end
  end

  def create_subscription
    Subscription.create(sale: self, owner: self.owner, product: self.product, start_date: Date.today, end_date: Date.today + 1.year)
  end

  private

    def populate_guid
      self.guid = SecureRandom.uuid
    end

end
