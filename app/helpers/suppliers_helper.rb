module SuppliersHelper

  def rating_as_css(value)
    case value
    when 1
     return 'one_star'
    when 2
      return 'two_star'
    when 3
      return 'three_star'
    when 4
      return 'four_star'
    when 5
      return 'five_star'
    else
      return nil
    end
  end

  def supplier_claimed_label(owned)
    if owned
      content_tag(:span, 'Claimed', class: 'label success')
    else
      content_tag(:span, 'Not claimed', class: 'label alert')
    end
  end

  def website_link_text(uri)
    URI.parse(uri).host
  end

end
