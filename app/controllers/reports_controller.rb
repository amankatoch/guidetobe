class ReportsController < ApplicationController

  before_action :authenticate_allowed_to_report

  def create
    @review = Review.find(params[:review_id])
    @report = @review.reports.new
    set_reporter_for(@report)
    @report.save
    redirect_to supplier_path(@review.supplier), notice: 'Thanks for reporting this review. We have been notified and will investigate it.'
  end

  private

    def set_reporter_for(report)
      if current_bride
        report.reportable = current_bride
      elsif current_owner
        report.reportable = current_owner
      end
    end

    def authenticate_allowed_to_report
      if !current_owner && !current_bride
        review = Review.find(params[:review_id])
        session[:return_to] = supplier_url(review.supplier)
        redirect_to signup_path, alert: 'Please login'
      end
    end

end