class SuppliersController < ApplicationController

  before_action :set_supplier, only: [:edit, :update, :show]
  before_action :authenticate_owner, only: [:edit, :update]
  before_action :confirm_bride, only: [:new]

  def new
    @supplier = Supplier.new
  end

  def edit
    check_owner(@supplier)
    @product = @supplier.owner.product
  end

  def update
    if @supplier.update(post_params)
      redirect_to supplier_path(@supplier), notice: 'Supplier details updated'
    else
      render :edit
    end
  end

  def create
    @supplier = Supplier.new(post_params)
    existing_supplier = Supplier.where(name: @supplier.name, category_id: @supplier.category_id, region_id: @supplier.region_id).first
    if existing_supplier
      redirect_to new_supplier_review_path(existing_supplier)
    else
      if @supplier.save
        if user_signed_in?
          supplier_type,supplier_email = @supplier.owner ? ["with_owner", @supplier.owner.email]: ["without_owner", @supplier.email]

          MixPanelTrack.event supplier_email, 'supplier_create', { 'supplier' => @supplier.name, 
                                                                          'region' => @supplier.region.name,
                                                                          'category' => @supplier.category.name,
                                                                          'creation_type' => supplier_type
                                                                          }
        end
        # send an email to the supplier if we have the email
        if @supplier.email?
          OwnerMailer.new_supplier_added(@supplier.email, @supplier.name).deliver
        end

        redirect_to new_supplier_review_path(@supplier), notice: 'Thanks for adding a new business and helping the Guide To Be network grow.'
      else
        render :new
      end
    end
  end

  def show
    if user_signed_in?
      MixPanelTrack.event get_user.email, 'supplier_view', { 'supplier' => @supplier.name }
    end

    @supplier_decorator = SupplierDecorator.new(@supplier)
    @reviews = @supplier.reviews.visible.order("created_at DESC")
    @page_title = @supplier.name + ' reviews'
    @page_description = 'Read reviews of ' + @supplier.name
    @page_keywords    = @supplier.name
  end

  private

    def post_params
      params.require(:supplier).permit(:name, :email, :phone, :website, :category_id, :region_id, :source, :source_other,
                                      :address, :facebook_url, :twitter_url, :google_url, :video_url,
                                      :logo_url, :image_one_url, :image_two_url, :image_three_url, :image_four_url, :description)
    end

    def check_owner(supplier)
      unless current_owner.owns?(supplier)
        redirect_to regions_path, notice: 'Unauthorised. You may only edit your own business.'
      end
    end

    def set_supplier
      @supplier = Supplier.includes(:reviews).friendly.find(params[:id])
    end

end
