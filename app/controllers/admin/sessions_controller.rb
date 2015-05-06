class Admin::SessionsController < ApplicationController

  layout 'admin_application'

  def new
    redirect_to admin_dashboard_path if current_admin
  end

  def create
    admin = Admin.authenticate(params[:username], params[:password])
    if admin
      session[:admin_id] = admin.id
      redirect_to admin_dashboard_path, notice: 'You have signed in successfully'
    else
      flash.now.alert = "Sorry that username or password is invalid"
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to regions_path
  end
end