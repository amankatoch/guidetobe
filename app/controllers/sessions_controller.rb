class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  # handles either brides or owners
  def create
    bride = Bride.authenticate(params[:username], params[:password])
    owner = Owner.authenticate(params[:username], params[:password])
    if bride
      login_bride(bride)
    elsif owner
      login_owner(owner)
    else
      flash.now.alert = 'Sorry that username or password is invalid'
      render :new
    end
  end

  def destroy
    session[:owner_id] = nil
    session[:bride_id] = nil
    session.delete(:return_to)
    redirect_to root_path
  end

  def login_bride(bride)
    bride.update_attributes(last_login: Time.now)
    session[:bride_id] = bride.id
    redirect_back_or root_path
  end

  def login_owner(owner)
    if owner.free_product?
      owner.update_attributes(last_login: Time.now)
      session[:owner_id] = owner.id
      redirect_to root_path
    else
      if owner.has_valid_subscription?
        owner.update_attributes(last_login: Time.now)
        session[:owner_id] = owner.id
        redirect_to root_path
      else
        owner.update_attributes(last_login: Time.now)
        session[:owner_id] = owner.id
        redirect_to show_buy_path(owner.product_id), notice: 'Please complete payment for your subscription'
      end
    end
  end

end