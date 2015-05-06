class Bride < ActiveRecord::Base
  default_scope order('id ASC')
  include Authentication
  make_flagger flag_once: true
  before_save { self.email = email.downcase }

  validates :name, presence: true
  validates :region, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, email: true
  validates :source, presence: true
  validates :username, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates_acceptance_of :terms, allow_nil: false, on: :create
  has_many :reviews, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy

  alias_attribute :first_name, :username
  alias_attribute :last_name, :username

  after_create :send_welcome_email

  def has_written_review_for?(supplier)
    reviews.each do |review|
      return true if review.supplier == supplier
    end
    false
  end

  def self.eligible_for_competition
    brides = []
    self.all.includes(:reviews).each do |bride|
      brides << bride if bride.reviews.count >= 2
    end
    return brides
  end

  def reviews_left_for_competition
    2 - reviews.count 
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    BrideMailer.password_reset(self).deliver
  end

  def has_avatar?
    return true if self.avatar.present?
  end

  def has_logged_in?
    return true if last_login != nil
  end

  def send_welcome_email
    BrideMailer.welcome(self).deliver
    weekly_reminder         = BrideMailer.delay(run_at: 7.days.from_now).welcome_follow_up(self)
    self.weekly_reminder_id = weekly_reminder.id
    self.save
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Bride.exists?(column => self[column])
  end

end
