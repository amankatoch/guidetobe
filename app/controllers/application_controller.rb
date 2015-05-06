class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  before_filter :set_cities_and_categories
  before_action :track_guest, unless: :user_signed_in?

  def current_bride
    @current_bride ||= Bride.find(session[:bride_id]) if session[:bride_id]
  end
  helper_method :current_bride

  def current_owner
    @current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
  end
  helper_method :current_owner

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  helper_method :current_admin

  def authenticate_user
    if !current_owner && !current_bride
      store_location
      redirect_to signup_path, alert: 'Please log in'
    end
  end

  def authenticate_owner
    if current_owner.nil?
      redirect_to signup_path, alert: 'Please log in'
    else
      if current_owner.paid_owner?
        unless current_owner.has_valid_subscription?
          redirect_to show_buy_path(current_owner.product), notice: 'Please complete purchase of your package'
        end
      end
    end
  end

  def authenticate_bride
    store_location
    redirect_to signup_path, alert: 'Please log in' if current_bride.nil?
  end

  def authenticate_admin
    redirect_to new_admin_session_path, alert: 'Not authorised' if current_admin.nil?
  end

  def confirm_bride
    if current_bride
      true
    elsif current_owner
      store_location
      redirect_to cities_path, notice: 'As a business owner you may not write reviews'
    else
      store_location
      redirect_to signup_path, notice: 'Please sign up/log in before posting a review'
    end
  end

  def set_cities_and_categories
    @region_names = Region.all
    @category_names = Category.order("name ASC")
  end

  def user_signed_in?
    current_bride || current_owner
  end
  helper_method :user_signed_in?

  def get_user
    if current_bride
      return current_bride
    end

    if current_owner
      return current_owner
    end
  end
  helper_method :get_user

  protected

  def track_guest
    session[:guest_id] ||= SecureRandom.hex(16)
  end

end
