class CityRequest < ActiveRecord::Base

  validates :email, presence: true, email: true
  validates :region, presence: true
  validates :wedding_date, presence: true

  after_create :notify_admin

  def notify_admin
    AdminMailer.new_city_request(self).deliver
  end

end
