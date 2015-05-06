class PasswordResetsController < ApplicationController

  def new
  end

  def create
    bride = Bride.find_by_email(email_params[:email])
    owner = Owner.find_by_email(email_params[:email])

    bride.send_password_reset if bride
    owner.send_password_reset if owner

    if bride || owner
      redirect_to regions_path, notice: "We've emailed your password details"
    else
      redirect_to new_password_reset_path, notice: "Sorry, but this email isn't registered on Guide To Be"
    end
  end

  def edit
    bride = Bride.find_by_password_reset_token(params[:id])
    owner = Owner.find_by_password_reset_token(params[:id])

    if bride
      @resource = bride
    elsif owner
      @resource = owner
    end
  end

  def update
    bride = Bride.find_by_password_reset_token(params[:id])
    owner = Owner.find_by_password_reset_token(params[:id])

    if bride
      if bride.password_reset_sent_at < 2.hours.ago
        redirect_to new_password_reset_path, alert: 'Password reset has expired'
      elsif bride.update_attributes(post_params[:bride])
        bride.update_attributes(last_login: Time.now)
        session[:bride_id] = bride.id
        redirect_to regions_path, notice: "Welcome back to Guide To Be #{bride.name}"
      else
        render :edit
      end
    elsif owner
      if owner.password_reset_sent_at < 2.hours.ago
        redirect_to new_password_reset_path, alert: 'Password reset has expired'
      elsif owner.update_attributes(post_params[:owner])
        owner.update_attributes(last_login: Time.now)
        session[:owner_id] = owner.id
        redirect_to regions_path, notice: "Welcome back to Guide To Be #{owner.name}"
      else
        render :edit
      end
    end
  end

  private

    def email_params
      params.permit(:email)
    end

    def post_params
      params.permit(bride: [:password, :password_confirmation], owner: [:password, :password_confirmation])
    end

end
