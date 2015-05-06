class BridesController < ApplicationController

  before_action :authenticate_bride, only: [:edit, :update]

  def new
    @bride = Bride.new
  end

  def edit
    @bride = Bride.find(params[:id])

    unless @bride == current_bride
      redirect_to login_path, notice: 'Please login to edit your profile'
    end
  end

  def update
    @bride = Bride.find(params[:id])
    if @bride.update(post_params)
      redirect_to regions_path, notice: 'Your profile has been updated'
    else
      render :edit
    end
  end

  def create
    @bride = Bride.new(post_params)
    if @bride.save
      MixPanelTrack.alias session[:guest_id], @bride.email
      MixPanelTrack.event @bride.email, 'sign_up', { 'type' =>'free'}
      MixPanelTrack.set_profile @bride.email, {
                                              'account_type' => 'free',
                                              '$email' => @bride.email,
                                              '$first_name' => @bride.name,
                                              '$last_name' => @bride.name,
                                              }
      redirect_to thankyoubride_path
    else
      flash.now.alert = 'Oops! There are some important details missing below.'
      render :new
    end
  end

  private

    def post_params
      params.require(:bride).permit(:name, :region,
                                    :email, :age, :source, :wedding_date,
                                    :wedding_place, :username, :password, :password_confirmation, :terms,
                                    :avatar, :source_other
                                    )
    end

end
