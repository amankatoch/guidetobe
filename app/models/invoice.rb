class Invoice < ActiveRecord::Base

  belongs_to :advertisement

  after_create :send_to_email

  validates :date, presence: true
  validates :reference, presence: true
  validates :email, presence: true
  validates :amount, presence: true, numericality: true
  validates :advertisement_id, presence: true

  def send_to_email
    InvoiceMailer.deliver_invoice(self).deliver
  end

  def complete_payment(token)
    update_attributes(paid: true, stripe_token: token )

    # update the ad and mark as active
    self.advertisement.update_attributes(active: true)
  end

end
