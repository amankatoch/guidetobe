class Category < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name

  has_many :suppliers
  has_many :reviews, through: :suppliers
  has_many :advertisements

  def suppliers_for_region(region)
    suppliers.where(region: region)
  end

  def supplier_count_for_region(region)
    suppliers_for_region(region).count
  end

  def self.truncate!
    connection.execute("truncate table #{quoted_table_name} restart identity")
  end  

end
