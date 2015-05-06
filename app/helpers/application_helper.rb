module ApplicationHelper

  def formatted_price(amount)
    sprintf('£%0.2f', amount)
  end


end
