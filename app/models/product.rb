class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :year_price, presence: true, numericality: true
  validates :package, :inclusion => { :in => PRODUCT_TYPES }

  has_many :sales
  has_many :owners
  has_many :subscriptions

  def free?
    true if year_price == 0
  end

  # options for owner to upgrade
  # owner on gold and with valid subscription will never get to this page
  def self.upgrade_options_for_owner(owner)
    if owner.free_product?
      # return the silver and golden subs
      return Product.where(package: [2,3])
    elsif owner.paid_owner? && owner.has_valid_subscription?
      return Product.where(package: [3])
    end
  end

  def cost_for_owner(owner)
    # if golden, check for already paid silver account
    if self.package == 3
      if owner.has_valid_subscription_for?(Product.where(package: 2))
        return 5000
      else
        return self.year_price
      end
    # otherwise just give normal year price
    else
      self.year_price
    end
  end

  def self.truncate!
    connection.execute("truncate table #{quoted_table_name} restart identity")
  end 

end
