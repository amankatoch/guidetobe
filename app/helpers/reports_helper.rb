module ReportsHelper

  def report_label(review)
    (review.reports.count > 0) ?
        content_tag(:span, 'Report', class: 'label alert') :
        content_tag(:span, 'No reports', class: 'label success')
  end

end