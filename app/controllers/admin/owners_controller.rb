class Admin::OwnersController < ApplicationController
  before_action :authenticate_admin
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  layout 'admin_application'

  def index
    @search = Owner.search(params[:q])
    @owners = @search.result.order(created_at: :desc)
  end

  def show
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(post_params)
    if @owner.save
      redirect_to admin_owners_path(@owner), notice: 'Owner successfully created'
    else
      flash.now.alert = 'Oops! There are some important details missing below.'
      render :new
    end

  end

  def edit
  end

  def update
    if @owner.update(post_params)
      redirect_to admin_owner_url(@owner), notice: 'Owner updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @owner.destroy
    redirect_to admin_owners_path, notice: 'Owner removed'
  end

  private
    def set_owner
      @owner = Owner.find(params[:id])
    end

    def post_params
      params.require(:owner).permit(:first_name, :last_name, :source, :source_other, :username, :email, :supplier_id, :product_id,
                                    :password, :password_confirmation, :terms)
    end
end