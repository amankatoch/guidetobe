class RepliesController < ApplicationController

  before_action :set_review
  before_action :authenticate_owner

  def new
    @reply = @review.replies.new
  end

  def create
    @reply = @review.replies.new(post_params)
    if @reply.save
      redirect_to @review.supplier, notice: 'Thank you for posting a reply to your review'
    else
      flash.now.alert = 'Ooops! There are some important details missing below.'
      render :new
    end
  end

  private

    def post_params
      params.require(:reply).permit(:body, :review_id, :owner_id)
    end

    def set_review
     @review = Review.find(params[:review_id])
    end

    def set_repliable
    end

end