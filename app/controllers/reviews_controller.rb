class ReviewsController < ApplicationController
  include SessionsHelper

  before_filter :confirm_bride, except: [:index]

  def index
    @bride    = Bride.find(params[:bride_id])
    @reviews = @bride.reviews.order_by_date
  end

  def new
    if params[:supplier_id] == nil
      redirect_to new_supplier_path
    else
      @supplier = Supplier.friendly.find(params[:supplier_id])
      @review = current_bride.reviews.new

      if current_bride.has_written_review_for?(@supplier)
        redirect_to @supplier, notice: "You've already written a review for this business. You can leave a review for another business <a href='/suppliers/new'>here</a>.".html_safe
      end
    end
  end

  def create
    unless post_params[:supplier_id].empty?
      @supplier = Supplier.find(post_params[:supplier_id])
    end

    @review = current_bride.reviews.new(post_params)
    if @review.save
        MixPanelTrack.event get_user.email, 'review_created', {'supplier' => @review.supplier.name }
        redirect_to supplier_path(@review.supplier, anchor: @review.id), notice: 'Thanks for your review'
    else
      flash.now.alert = 'Please review your form. Parts marked * must be filled in.'
      render :new
    end
  end


  private

    def post_params
      params.require(:review).permit(:general_content, :like_content, :unlike_content,
                                      :service, :price, :overall, :supplier_id, :terms,
                                      :image_one_url, :image_two_url, :image_three_url)
    end

end
