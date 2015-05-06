class AdRequest < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :supplier_name, presence: true
  validates :email, presence: true, email: true
  validates :phone, presence: true
  validates :contact_preference, presence: true
  validates :category_id, presence: true, numericality: true

  belongs_to :category

  after_create :notify_admin

  def full_name
    first_name + " " + last_name
  end

  private

    def notify_admin
      AdminMailer.new_ad_request(self)
    end

end
