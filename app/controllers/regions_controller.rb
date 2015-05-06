class RegionsController < ApplicationController


  def index
    cookies[:gtb_notification_cookies] = {value: 'a yummy cookie', expires: 5.year.from_now} if cookies[:gtb_notification_cookies].blank?
    @regions = Region.all
    @recent_reviews = Review.recent
    @page_title = 'Reviews of Wedding Services, Products and Venues'
    @page_description = 'Guide To Be helps brides planning a wedding by listing honest reviews of wedding suppliers UK. It is a wedding planning guide for UK brides.'
    @page_keywords    = 'wedding planning guide, planning a wedding, wedding suppliers uk, wedding suppliers, wedding service'

    

  end

  def show
    @region = Region.friendly.find(params[:id])
    @categories = Category.order("name ASC")
    case @region.name
        when "North East"
          @page_title = 'Wedding Suppliers and Bridal Shops in North East'
          @page_description = 'Find information and reviews of wedding shops, bridal shops, and wedding suppliers in North East'
          @page_keywords  = 'bridal shops North East, wedding shops North East, bridal shops in North East, North East bridal shops, wedding shops in North East, wedding suppliers North East'
        when "Scotland"
          @page_title = 'Bridal Shops and Wedding Suppliers in Scotland'
          @page_description = 'Find information and reviews of wedding shops, bridal shops, and wedding suppliers in Scotland'
          @page_keywords  = 'wedding suppliers scotland, bridal shops Scotland, wedding shops Scotland, Scotland bridal shops, bridal shops in Scotland, wedding shops in Scotland, Scotland wedding shops, wedding supplies Scotland, wedding stores Scotland'
        when "Yorkshire"
          @page_title = 'Bridal Shops in Yorkshire'
          @page_description = 'Find information and reviews of wedding shops, bridal shops, and wedding suppliers in Yorkshire'
          @page_keywords  = 'bridal shops Yorkshire, bridal shops in Yorkshire, Yorkshire bridal shops, wedding shops Yorkshire, wedding shops in Yorkshire'
        when "North West"
          @page_title = 'Bridal Shops and Wedding Suppliers in North West'
          @page_description = 'Find information and reviews of wedding shops, bridal shops, and wedding suppliers in North West'
          @page_keywords  = 'bridal shops North West, North West bridal shops, wedding shops North West, bridal shops in North West, wedding shops in North West, North West wedding shops'
        when "West Midlands"
          @page_title = 'Bridal Shops in West Midlands, Wedding Supplies'
          @page_description = 'Find information and reviews of wedding shops, bridal shops, and wedding suppliers in West Midlands'
          @page_keywords  = 'bridal shops West Midlands, bridal shops in West Midlands, wedding shops in West Midlands, West Midlands bridal shops, wedding shops West Midlands, wedding shop West Midlands, West Midlands wedding shops'
        when "Wales"
          @page_title = 'Wales Wedding Shops and Suppliers'
          @page_description = 'Find information and reviews of wedding shops, bridal shops, and wedding suppliers in Wales'
          @page_keywords  = 'bridal shops Wales, Wales bridal shops, bridal shops in Wales, wedding shops in Wales, Wales wedding shops, wedding shops Wales'
        when "London & South East"
          @page_title = 'Bridal Shops in London & South East, Wedding Suppliers'
          @page_description = 'Find information and reviews of wedding shops, bridal shops, and wedding suppliers in London & South East'
          @page_keywords  = 'bridal shops London & South East, wedding shops in London & South East, wedding shops London & South East, bridal shops in London & South East, London & South East bridal shops, wedding stores in London & South East, wedding suppliers London & South East'
      
    end

    @top_five_suppliers = Supplier.top_five_for_region(@region)
  end
end
