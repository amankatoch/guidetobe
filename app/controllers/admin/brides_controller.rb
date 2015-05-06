class Admin::BridesController < ApplicationController
  before_action :set_bride, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin

  layout 'admin_application'

  def index
    @search = Bride.search(params[:q])
    @brides = @search.result.order("created_at DESC")

  end

  def new
    @bride = Bride.new
  end


  def create
    @bride = Bride.new(post_params)
    if @bride.save
      redirect_to admin_bride_path(@bride), notice: 'Bride added successfully'
    else
      flash.now.alert = "Error with the form. Please make sure all the fields are filled out"
      render :new
    end
  end

  def show
    @reviews = @bride.reviews
  end

  def edit
  end

  def update
    if @bride.update(post_params)
      redirect_to admin_bride_url(@bride), notice: 'Bride updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @bride.destroy
    redirect_to admin_brides_path, notice: 'Bride removed'
  end

  private
    def set_bride
      @bride = Bride.find(params[:id])
    end

    def post_params
      params.require(:bride).permit(:name, :region, :email, :age, :source, :source_other, :wedding_date, :wedding_place,
                                    :username, :password, :password_confirmation, :terms, :avatar)
    end
end