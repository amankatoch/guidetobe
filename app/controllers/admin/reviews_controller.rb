class Admin::ReviewsController < ApplicationController

  before_action :authenticate_admin
  before_action :set_review, only: [:show, :edit, :update, :destroy, :toggle_visibility]

  layout 'admin_application'

  def index
    if params[:query] == 'reported'
      @reviews = Review.reported
    else
      @reviews = Review.all.includes(:reports, :supplier).order('reviews.created_at DESC')
    end
  end

  def edit
  end

  def update
    if @review.update(post_params)
      redirect_to admin_review_path(@review), notice: 'Review udpated'
    else
      render :edit
    end
  end

  def show
  end

  def toggle_visibility
    @review.toggle(:hidden).save
    @review.update_supplier_rating
    redirect_to [:admin, @review], notice: 'Review visibility updated'
  end

  # we need to update the supplier rating once the review is gone
  def destroy
    supplier = @review.supplier
    @review.destroy
    supplier.update_rating
    redirect_to admin_reviews_path, notice: 'Review has been removed'
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def post_params
      params.require(:review).permit(:supplier_id, :bride_id, :general_content, :like_content,
                                    :unlike_content, :service, :price, :overall, :hidden, :image_one_url, :image_two_url, :image_three_url)
    end

end
