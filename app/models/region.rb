class Region < ActiveRecord::Base

  default_scope { order(:name) }

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates :description, presence: true

  has_many :suppliers
  has_many :reviews, through: :suppliers
  has_many :advertisements


  def self.truncate!
    connection.execute("truncate table #{quoted_table_name} restart identity")
  end

end
