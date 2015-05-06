class Owner < ActiveRecord::Base
  include Authentication

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, email: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :source, presence: true

  # validates :supplier_id, presence: true, numericality: true
  validates :product_id, presence: true, numericality: true

  validates_acceptance_of :terms, allow_nil: false, on: :create

  after_create :send_welcome_email

  delegate :name, to: :supplier, prefix: true

  belongs_to :supplier
  belongs_to :product
  has_many :reports, as: :reportable
  has_many :sales
  has_many :replies
  has_many :subscriptions

  def name
    first_name + ' ' + last_name
  end

  def review_count
    supplier.reviews.count
  end

  def plan
    product.name
  end

  def free_product?
    true if product.package == 1
  end

  def paid_owner?
    true if product.package == 2 || product.package == 3
  end

  def maximum_plan?
    true if product.package == 3
  end

  def has_logged_in?
    true if last_login != nil
  end

  def has_valid_subscription?
    owner_product = self.product
    subscriptions.each do |subscription|
      if subscription.in_date? && subscription.is_for?(owner_product)
        return true
      end
    end

    false
  end

  def has_valid_subscription_for?(product)
    subscriptions.each do |subscription|
      if subscription.in_date? && subscription.is_for?(product)
        return true
      end
    end

    false
  end

  def most_recent_subscribed_product
    subscriptions.order(:created_at).first.product
  end

  def owns?(query_supplier)
    supplier == query_supplier ? true : false
  end

  def send_welcome_email
    OwnerMailer.welcome(self).deliver
    reminder1         = OwnerMailer.delay(run_at: 7.days.from_now).upgrade_subscription_first_week(self)
    reminder2         = OwnerMailer.delay(run_at: 14.days.from_now).upgrade_subscription_second_week(self)
    self.reminder1_id = reminder1.id
    self.reminder2_id = reminder2.id
    self.save
  end

  # delete the record from delayed job if the owner upgraded his package before week
  def self.downgrade_subscription_reminder(owner)
    Delayed::Job.find_by_id(owner.reminder1_id).destroy rescue nil
    Delayed::Job.find_by_id(owner.reminder2_id).destroy rescue nil
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    OwnerMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Owner.exists?(column => self[column])
  end

end

