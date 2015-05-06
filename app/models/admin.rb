class Admin < ActiveRecord::Base
  include Authentication

  validates :username, presence: true
  validates :email, presence: true

  def self.truncate!
    connection.execute("truncate table #{quoted_table_name} restart identity")
  end

end
