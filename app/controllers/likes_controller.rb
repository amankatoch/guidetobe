class LikesController < ApplicationController
  before_action :check_and_set_bride

  def create
    review = Review.find(params[:review_id])
    @bride.flag(review, 'like')
    redirect_to review.supplier, notice: 'Thanks for the like!'
  end

  private

    def check_and_set_bride
      if current_bride
        @bride = current_bride
      else
        redirect_to :back, notice: 'Only brides can like reviews'
      end
    end
end