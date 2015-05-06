class OwnersController < ApplicationController

  before_action :check_not_owner_or_bride, only: [:new]

  def new
    # we are setting supplier as main ivar here as it has a :has_one with owner
    if params[:query]
      @product = Product.find_by_name(params[:query])
    end

    @supplier = Supplier.new
    @owner = @supplier.build_owner
  end

  def create
    @supplier = Supplier.new(post_params)

    potential_supplier = Supplier.find_by_name(post_params[:name])
    # this supplier is already registered
    if potential_supplier
      # supplier is owned reshow the form and an error message
      if potential_supplier.owned?
        flash.now.alert = 'This business is already owned by somebody else. Please contact us if you think this is an error.'
        render :new
      # otherwise try to update the supplier
      else
        if potential_supplier.update(post_params)
          redirect_for_plan(potential_supplier.owner)
        else
          flash.now.alert = 'Please review your form. Parts marked * must be filled in.'
          render :new
        end
      end
    # we we cant find the supplier then create a new one
    else
      if @supplier.save
        MixPanelTrack.alias session[:guest_id], @supplier.email
        MixPanelTrack.event @supplier.owner.email, 'sign_up', { 'type' => @supplier.owner.product.name.downcase }
        MixPanelTrack.set_profile @supplier.owner.email, {
                                                          'account_type' => @supplier.owner.product.name.downcase,
                                                          '$email' => @supplier.owner.email,
                                                          '$first_name' => @supplier.owner.first_name,
                                                          '$last_name' => @supplier.owner.last_name,
                                                          }
        MixPanelTrack.event @supplier.owner.email, 'supplier_create', { 'supplier' => @supplier.name, 
                                                                        'region' => @supplier.region.name,
                                                                        'category' => @supplier.category.name }
        redirect_for_plan(@supplier.owner)
      else
        flash.now.alert = 'Please review your form. Parts marked * must be filled in.'
        render :new
      end
    end
  end

  def edit
    if params[:query] && params[:query] == 'review'
      flash.now.alert = 'To respond to a review of your business and for lots more features, you need to upgrade your business listing.'
    end

    @owner = Owner.find(params[:id])
    @product = @owner.product

    # maximum plan
    if @owner.maximum_plan? && @owner.has_valid_subscription?
      redirect_to :back, alert: 'You are already on the maximum plan'
    end

    if @owner.paid_owner? && !@owner.has_valid_subscription?
      @upgrading = true
    end
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update(params.require(:owner).permit(:product_id))
      if @owner.paid_owner?
        redirect_to show_buy_path(@owner.product_id, query: 'upgrade')
      else
        redirect_to free_signup_complete_path
      end
    else
      render :edit
    end
  end

  def edit_profile
    @owner = Owner.find(params[:owner_id])
  end

  def update_profile
    @owner = Owner.find(params[:owner_id])
    if @owner.update(params.require(:owner).permit(:first_name, :last_name, :source, :source_other, :username, :email, :password, :password_confirmation))
      redirect_to supplier_path(@owner.supplier), notice: 'Thanks. Your profile was updated.'
    else
      flash.now.alert = 'Please make sure all the require fields are filled in.'
      render :edit_profile
    end
  end

  # free_signup_complete_path
  def added
  end

  def downgrade
    @owner = Owner.find(params[:owner_id])
    @product = @owner.product
  end

  def accept_downgrade
    @owner = Owner.find(params[:owner_id])

    if !@owner.subscriptions.empty?
      # downgrade them to their previous subscription
      @owner.product = @owner.most_recent_subscribed_product
      @owner.save
    else
      # downgrade them to premium
      @owner.product = Product.where(package: 1).first
      @owner.save
    end

    redirect_to supplier_path(@owner.supplier), notice: 'Thank you. Your package has not been upgraded.'
  end

  private

    def post_params
      params.require(:supplier).permit(:name, :category_id,  :region_id, :website, :logo_url, :phone, :email,
                                      owner_attributes: [:id, :first_name, :last_name, :email, :source, :source_other, :username, :password, :password_confirmation, :product_id, :terms, :supplier_id])

    end

    # log the user in and redirect according to their plan
    def redirect_for_plan(owner)
      if owner.free_product?
        login_owner(owner)
        redirect_to free_signup_complete_path
      else
        login_owner(owner)
        redirect_to show_buy_path(owner.product_id)
      end
    end

    def login_owner(owner)
      owner.update_attributes(last_login: Time.now)
      session[:owner_id] = owner.id
    end

    def check_not_owner_or_bride
      if current_owner
        redirect_to regions_path, alert: "You are already registered on Guide To Be. You can view your listing options using the Business listing tab above."
      elsif current_bride
        redirect_to regions_path, alert: "Sorry! You're logged in with a user profile. To create a business listing please log out and click on the free business listing button."
      end
    end

end
