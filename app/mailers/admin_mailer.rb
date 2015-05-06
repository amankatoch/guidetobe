class AdminMailer < ActionMailer::Base
  default from: "donotreply@guidetobe.co.uk"

  def new_report(report)
    @report = report
    Admin.all.each do |admin|
      mail(to: admin.email, subject: 'New report posted on Guide To Be')
    end
  end

  def new_city_request(city_request)
    @city_request = city_request
    Admin.all.each do |admin|
      mail(to: admin.email, subject: 'New city request')
    end
  end

  def new_ad_request(ad_request)
    @ad_request = ad_request
    Admin.all.each do |admin|
      mail(to: admin.email, subject: 'New Ad Reqest')
    end
  end
end
