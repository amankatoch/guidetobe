module ReviewsHelper

  def review_rating_as_css(value)
    case value
    when 1
      return 'one'
    when 2
      return 'two'
    when 3
      return 'three'
    when 4
      return 'four'
    when 5
      return 'five'
    else
      return nil
    end
  end

  def hidden_label(review)
    if review.hidden
      content_tag(:span, 'Hidden', class: 'label alert')
    else
      content_tag(:span, 'Visible', class: 'label success')
    end
  end

end