class Report < ActiveRecord::Base

  belongs_to :review
  belongs_to :reportable, polymorphic: true

  after_create :notify_admin_and_reporter

  def notify_admin_and_reporter
    AdminMailer.new_report(self).deliver
  end

end
