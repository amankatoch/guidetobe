class PagesController < ApplicationController

  layout 'holding', only: :home

  # holding page
  def home
  end

  def about
    @page_title = 'About page title'
    @page_description = 'About page description'
    @page_keywords    = 'aboutkeyword1, aboutkeyword2, aboutkeywords3'
  end

  def advertise_with_us
  end

  def faqs
  end

  def terms
  end

  def cookies
  end

  def supplier_terms
  end

  def business_listings
    if current_owner
      redirect_to regions_path, notice: "You are already registered on Guide To Be. You can view your listing options using the Business listing tab above."
    end
  end

  def business_claim_listings

    if current_owner
      redirect_to regions_path, notice: "You are already registered on Guide To Be. You can view your listing options using the Business listing tab above."
    end

    flash.now.notice = 'To create a full business listing please choose from the packages below'
    render :business_listings
  end

  def contact
  end

  def competition
    @page_title = 'Competition page title'
    @page_description = 'Competition page description'
    @page_keywords    = 'compkeyword1, compkeyword2, compkeywords3'
  end

  def download
    send_file 'public/supplier_badge.png', :type=>"application/png", :x_sendfile=>true
  end

end
