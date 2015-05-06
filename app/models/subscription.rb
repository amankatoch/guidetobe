class Subscription < ActiveRecord::Base

  belongs_to :owner
  belongs_to :sale
  belongs_to :product

  def in_date?
    (self.end_date <= Date.today) ? false : true
  end

  def type
    product.name
  end

  def is_for?(product)
    true if self.product == product
  end

end
