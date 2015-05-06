class Advertisement < ActiveRecord::Base

  belongs_to :region
  belongs_to :category
  has_many :invoices

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :contact_name, presence: true
  validates :contact_email, presence: true
  validates :image_url, presence: true
  validates :region_id, presence: true
  validates :category_id, presence: true
  validates :ad_type, presence: true

end
