class CategoriesController < ApplicationController

  def show
    if params[:region_id]
      @region = Region.friendly.find(params[:region_id])
      @category = Category.friendly.find(params[:id])
      case @region.name
        when "North East"
          if @category.name == "Florists"
            @page_title = 'Wedding Florists And Wedding Flowers Shops in North East'
            @page_description = 'Find information and reviews of wedding flowers and florists in North East'
            @page_keywords  = 'florists in North East, wedding flowers North East, wedding florist North East, florists North East'
          elsif @category.name == "Dresses"
            @page_title = 'Bridal Wedding Dresses Shops in North East'
            @page_description = 'Find information and reviews of wedding dresses and wedding dress shops in North East'
            @page_keywords  = 'wedding dresses North East, wedding dress shops North East, wedding dress shops in North East, wedding dress shop North East, wedding dresses in North East'
          elsif @category.name == "Cars"
            @page_title = 'North East Wedding Cars Hire'
            @page_description = 'Find information and reviews of wedding cars and wedding care hire in North East'
            @page_keywords  = 'wedding cars North East, wedding car hire North East, North East wedding cars, wedding car hire in North East'
          elsif @category.name == "Accessories"
            @page_title = 'Bridal Wedding Accessories in North East'
            @page_description = 'Find information and reviews of wedding accessories in North East'
            @page_keywords  = 'wedding accessories North East'
          elsif @category.name == "Venues"
            @page_title = 'North East Wedding Venues and Reception Venues'
            @page_description = 'Find information and reviews of wedding venues in North East'
            @page_keywords  = 'wedding venues North East, wedding venues in North East, North East wedding venues, wedding venue North East'
          elsif @category.name == "Catering"
            @page_title = 'Wedding Caterers and Catering Companies in North East'
            @page_description = 'Find information and reviews of wedding caterers and catering companies in North East'
            @page_keywords  = 'North East wedding catering, catering companies North East, wedding catering North East, wedding caterers in North East'
          elsif @category.name == "Entertainment"
            @page_title = 'North East Wedding Bands'
            @page_description = 'Find information and reviews of North East wedding bands and find the perfect wedding band for you'
            @page_keywords  = 'wedding bands North East, wedding band North East, North East wedding band, North East wedding bands'
          elsif @category.name == "Hair and Make-up"
            @page_title = 'Bridal Wedding Hair and Makeup North East'
            @page_description = 'Find information and reviews of bridal makeup in North East and also wedding hair and makeup in North East'
            @page_keywords  = 'bridal makeup North East, wedding hair and makeup North East, North East wedding hair and makeup, bridal hair and makeup North East'
          elsif @category.name == "Photographers"
            @page_title = 'North East Wedding Photographers and Photograhy Services'
            @page_description = 'Find information and reviews of wedding photographers in North East and the find the perfect wedding videographer or wedding photographer for you'
            @page_keywords  = 'wedding photographer North East, wedding photographers North East, North East wedding photographers, North East wedding photographer, Wedding photography North East, North East Wedding photography, wedding videographer North East'
          elsif @category.name == "Cakes"
            @page_title = 'Wedding Cakes Suppliers in North East'
            @page_description = 'Find information and reviews of wedding cakes in North East and find the perfect wedding cake for you'
            @page_keywords  = 'wedding cakes North East, wedding cake North East, wedding cakes in North East'
          elsif @category.name == "Stationery"
            @page_title = 'Wedding Invitations and Stationery Suppliers North East'
            @page_description = 'Find information and reviews of wedding stationery in North East and find the perfect wedding invitations for you'
            @page_keywords  = 'wedding invitations North East, wedding stationery North East, North East wedding invitations'
          end
        when "Scotland"
          if @category.name == "Florists"
            @page_title = 'Bridal Flowers and Wedding Florists in Scotland'
            @page_description = 'Find information and reviews of wedding florists in Scotland and find the perfect bridal flowers for you'
            @page_keywords  = 'wedding florist scotland, florists scotland, florists in scotland, wedding florists scotland, scotland wedding florists, bridal flowers scotland'
          elsif @category.name == "Dresses"
            @page_title = 'Scotland Wedding Dress Shops'
            @page_description = 'Find information and reviews of wedding dresses and wedding dress shops in Scotland'
            @page_keywords  = 'wedding dress shops Scotland, wedding dresses Scotland, wedding dress shops in Scotland, Scotland wedding dress shops, wedding dresses in Scotland, wedding dress shop Scotland'
          elsif @category.name == "Cars"
            @page_title = 'Wedding Cars For Hire in Scotland'
            @page_description = 'Find information and reviews of wedding cars and wedding care hire in Scotland'
            @page_keywords  = 'wedding cars scotland, wedding car hire Scotland, Scotland wedding cars, wedding cars in Scotland, wedding car hire in Scotland, Scotland wedding car hire'
          elsif @category.name == "Accessories"
            @page_title = 'Bridal Wedding Accessories Scotland'
            @page_description = 'Find information and reviews of wedding accessories in Scotland and find the perfect bridal hair accessories for you'
            @page_keywords  = 'wedding accessories Scotland, bridal accessories Scotland, bridal hair accessories Scotland'
          elsif @category.name == "Venues"
            @page_title = 'Wedding Venues in Scotland'
            @page_description = 'Find information and reviews of wedding venues in Scotland'
            @page_keywords  = 'wedding venues Scotland, Scotland wedding venues, wedding venues in Scotland, wedding venue Scotland'
          elsif @category.name == "Catering"
            @page_title = 'Catering Companies, Wedding Caterers in Scotland'
            @page_description = 'Find information and reviews of wedding caterers and catering companies in Scotland'
            @page_keywords  = 'wedding catering scotland, wedding caterers scotland, catering companies Scotland, Scotland wedding caterers'
          elsif @category.name == "Entertainment"
            @page_title = 'Wedding Bands For Hire in Scotland'
            @page_description = 'Find information and reviews of wedding bands in Scotland and hire the perfect wedding band for you'
            @page_keywords  = 'wedding bands Scotland, wedding band Scotland, Scotland wedding bands, Scotland wedding band, wedding bands in Scotland, wedding band hire Scotland'
          elsif @category.name == "Hair and Make-up"
            @page_title = 'Bridal Hair and Makeup, Wedding Hairdressers Scotland'
            @page_description = 'Find information and reviews of bridal makeup in Scotland and also wedding hair and makeup in Scotland'
            @page_keywords  = 'wedding hair and makeup Scotland, bridal makeup Scotland, bridal hair and makeup Scotland, wedding hairdressers Scotland, wedding hair and make-up Scotland'
          elsif @category.name == "Photographers"
            @page_title = 'Scotland Wedding Photographers'
            @page_description = 'Find information and reviews of wedding photographers in Scotland and the find the perfect wedding videographer or wedding photographer for you'
            @page_keywords  = 'scotland wedding photographers, wedding photography scotland, wedding photographers Scotland, wedding photographer Scotland, Scotland wedding photographer, Scotland Wedding photography, wedding videographer Scotland'
          elsif @category.name == "Cakes"
            @page_title = 'Wedding Cakes Suppliers in Scotland'
            @page_description = 'Find information and reviews of wedding cakes in Scotland and find the perfect wedding cake for you'
            @page_keywords  = 'wedding cakes scotland, wedding cake Scotland, Scotland wedding cakes, wedding cakes in Scotland'
          elsif @category.name == "Stationery"
            @page_title = 'Wedding Stationery Suppliers in Scotland'
            @page_description = 'Find information and reviews of wedding stationery in Scotland and find the perfect wedding invitations for you'
            @page_keywords  = 'wedding invitations scotland, wedding stationery scotland, Scotland wedding invitations, Scotland wedding stationery'
          end
        when "Yorkshire"
          if @category.name == "Florists"
            @page_title = 'Wedding Florists in Yorkshire'
            @page_description = 'Find information and reviews of wedding florists in Yorkshire and find the perfect wedding flowers for you'
            @page_keywords  = 'wedding flowers Yorkshire, florists in Yorkshire, Yorkshire florists, wedding florist Yorkshire'
          elsif @category.name == "Dresses"
            @page_title = 'Wedding Dress Suppliers and Shops in Yorkshire'
            @page_description = 'Find information and reviews of wedding dresses and wedding dress shops in Yorkshire'
            @page_keywords  = 'wedding dresses Yorkshire, wedding dress shops in Yorkshire, wedding dress shop Yorkshire, wedding dresses in Yorkshire, Yorkshire wedding dress shops, wedding dress shops Yorkshire'
          elsif @category.name == "Cars"
            @page_title = 'Yorkshire Wedding Car Hire'
            @page_description = 'Find information and reviews of wedding cars and wedding care hire in Yorkshire'
            @page_keywords  = 'wedding car hire Yorkshire, wedding cars Yorkshire, wedding cars in Yorkshire, Yorkshire wedding car hire, wedding car hire in Yorkshire'
          elsif @category.name == "Accessories"
            @page_title = 'Wedding Accessories For Bride in Yorkshire'
            @page_description = 'Find information and reviews of wedding accessories in Yorkshire'
            @page_keywords  = 'wedding accessories Yorkshire'
          elsif @category.name == "Venues"
            @page_title = 'Find The Best Wedding Venues in Yorkshire'
            @page_description = 'Find information and reviews of wedding venues in Yorkshire'
            @page_keywords  = 'wedding venues Yorkshire, wedding venues in Yorkshire, Yorkshire wedding venues, wedding venue Yorkshire'
          elsif @category.name == "Catering"
            @page_title = 'Wedding Catering Suppliers in Yorkshire'
            @page_description = 'Find information and reviews of wedding caterers and catering companies in Yorkshire'
            @page_keywords  = 'catering companies Yorkshire, wedding caterers Yorkshire, wedding catering Yorkshire, catering companies in Yorkshire'
          elsif @category.name == "Entertainment"
            @page_title = 'Wedding Bands Supplies in Yorkshire'
            @page_description = 'Find information and reviews of wedding bands in Yorkshire and hire the perfect wedding band for you'
            @page_keywords  = 'wedding band Yorkshire, wedding bands Yorkshire, Yorkshire wedding band, Yorkshire wedding bands, wedding bands in Yorkshire, wedding band hire Yorkshire'
          elsif @category.name == "Hair and Make-up"
            @page_title = 'Wedding Hair and Makeup Artists in Yorkshire'
            @page_description = 'Find information and reviews of bridal makeup in Yorkshire and also wedding hair and makeup in Yorkshire'
            @page_keywords  = 'wedding hair and makeup Yorkshire, bridal makeup Yorkshire, bridal hair and makeup Yorkshire'
          elsif @category.name == "Photographers"
            @page_title = 'Wedding Photographers in Yorkshire'
            @page_description = 'Find information and reviews of wedding photographers in Yorkshire and the find the perfect wedding videographer or wedding photographer for you'
            @page_keywords  = 'wedding photography Yorkshire, Yorkshire wedding photographer, wedding photographer Yorkshire, wedding photographers Yorkshire, wedding videographer Yorkshire, Yorkshire Wedding photography, Yorkshire wedding photographers'
          elsif @category.name == "Cakes"
            @page_title = 'Wedding Cakes Shops in Yorkshire'
            @page_description = 'Find information and reviews of wedding cakes in Yorkshire and find the perfect wedding cake for you'
            @page_keywords  = 'wedding cakes Yorkshire, wedding cake Yorkshire, wedding cakes in Yorkshire, Yorkshire wedding cakes'
          elsif @category.name == "Stationery"
            @page_title = 'Wedding Invitations and Stationery Shops Yorkshire'
            @page_description = 'Find information and reviews of wedding stationery in Yorkshire and find the perfect wedding invitations for you'
            @page_keywords  = 'wedding invitations Yorkshire, wedding stationery Yorkshire'
          end
        when "North West"
          if @category.name == "Florists"
            @page_title = 'North West Wedding Florists'
            @page_description = 'Find information and reviews of wedding florists in North West and find the perfect wedding flowers for you'
            @page_keywords  = 'wedding florist North West, florists in North West, wedding flowers North West, North West florists, North West florist'
          elsif @category.name == "Dresses"
            @page_title = 'Find Wedding Dresses Shops in North West'
            @page_description = 'Find information and reviews of wedding dresses and wedding dress shops in North West'
            @page_keywords  = 'wedding dresses North West, wedding dress shops North West, wedding dress shops in North West, wedding dresses in North West, wedding dress shop North West'
          elsif @category.name == "Cars"
            @page_title = 'Wedding Car Hire For Special Day in North West'
            @page_description = 'Find information and reviews of wedding cars and wedding care hire in North West'
            @page_keywords  = 'wedding cars North West, wedding car hire North West, North West wedding cars, wedding cars in North West, wedding car hire in North West'
          elsif @category.name == "Accessories"
            @page_title = 'Bridal Wedding Accessories North West'
            @page_description = 'Find information and reviews of wedding accessories in North West and find the perfect bridal accessories for you'
            @page_keywords  = 'bridal accessories North West, wedding accessories North West'
          elsif @category.name == "Venues"
            @page_title = 'Choose Perfect Wedding Venues in North West'
            @page_description = 'Find information and reviews of wedding venues in North West'
            @page_keywords  = 'wedding venues in North West, wedding venues North West, North West wedding venues, wedding venue North West'
          elsif @category.name == "Catering"
            @page_title = 'Wedding Catering Companies in North West'
            @page_description = 'Find information and reviews of wedding caterers and catering companies in North West'
            @page_keywords  = 'wedding caterers North West, catering companies North West, wedding catering North West, catering companies in North West'
          elsif @category.name == "Entertainment"
            @page_title = 'Wedding Band Supplies in North West'
            @page_description = 'Find information and reviews of wedding bands in North West and hire the perfect wedding band for you'
            @page_keywords  = 'wedding bands North West, wedding band North West, North West wedding band, North West wedding bands, North West wedding band hire, wedding bands in North West, wedding band hire North West'
          elsif @category.name == "Hair and Make-up"
            @page_title = 'Hire Wedding Hair and Makeup Artists in North West'
            @page_description = 'Find information and reviews of bridal makeup in North West and also wedding hair and makeup in North West'
            @page_keywords  = 'bridal makeup North West, wedding hair and makeup North West, bridal hair and makeup North West, wedding hairdressers North West'
          elsif @category.name == "Photographers"
            @page_title = 'Professional Wedding Photographers in North West'
            @page_description = 'Find information and reviews of wedding photographers in North West and the find the perfect wedding photographer for you'
            @page_keywords  = 'wedding photographer North West, wedding photographers in North West, wedding photographers North West, wedding photography North West'
          elsif @category.name == "Cakes"
            @page_title = 'North West Wedding Cake Shops'
            @page_description = 'Find information and reviews of wedding cakes in North West and find the perfect wedding cake for you'
            @page_keywords  = 'wedding cakes North West, wedding cake North West, North West wedding cakes, wedding cakes in North West'
          elsif @category.name == "Stationery"
            @page_title = 'Wedding Invitations in North West'
            @page_description = 'Find information and reviews of wedding stationery in North West and find the perfect wedding invitations for you'
            @page_keywords  = 'wedding stationery North West, wedding invitations North West, North West wedding magazine, North West wedding invitations'
          end
        when "West Midlands"
          if @category.name == "Florists"
            @page_title = 'West Midlands Wedding Florists, Wedding Flowers Suppliers'
            @page_description = 'Find information and reviews of wedding florists in West Midlands and find the perfect wedding flowers for you'
            @page_keywords  = 'wedding flowers West Midlands, florists in West Midlands, wedding florist West Midlands, West Midlands florist'
          elsif @category.name == "Dresses"
            @page_title = 'Wedding Dress Shops and Suppliers in West Midlands'
            @page_description = 'Find information and reviews of wedding dresses, bridesmaid dress, and wedding dress shops in West Midlands'
            @page_keywords  = 'wedding dress shops West Midlands, wedding dresses West Midlands, wedding dress shops in West Midlands, bridesmaid dresses West Midlands, wedding dress outlet West Midlands, wedding dress shop West Midlands, wedding dress hire West Midlands, wedding dresses in West Midlands'
          elsif @category.name == "Cars"
            @page_title = 'Wedding Cars For Hire in West Midlands'
            @page_description = 'Find information and reviews of wedding cars and wedding care hire in West Midlands'
            @page_keywords  = 'wedding car hire West Midlands, wedding cars West Midlands, wedding cars in West Midlands, wedding car hire in West Midlands, West Midlands wedding car hire'
          elsif @category.name == "Accessories"
            @page_title = 'West Midlands Wedding Accessories Supplies'
            @page_description = 'Find information and reviews of wedding accessories in West Midlands and find the perfect bridal accessories for you'
            @page_keywords  = 'bridal accessories West Midlands, wedding accessories West Midlands, wedding shoes West Midlands'
          elsif @category.name == "Venues"
            @page_title = 'Wedding Venues and Reception Venues in West Midlands'
            @page_description = 'Find information and reviews of wedding venues and wedding reception venues in West Midlands'
            @page_keywords  = 'wedding venues in West Midlands, wedding venues West Midlands, West Midlands wedding venues, wedding venue West Midlands, wedding reception venues West Midlands, West Midlands wedding venue'
          elsif @category.name == "Catering"
            @page_title = 'Wedding Caterers in West Midlands'
            @page_description = 'Find information and reviews of wedding caterers and catering companies in West Midlands'
            @page_keywords  = 'wedding caterers West Midlands, catering companies West Midlands, wedding catering West Midlands, catering companies in West Midlands'
          elsif @category.name == "Entertainment"
            @page_title = 'Wedding Bands For Hire in West Midlands'
            @page_description = 'Find information and reviews of wedding bands in West Midlands and hire the perfect wedding band for you'
            @page_keywords  = 'wedding band West Midlands, wedding bands West Midlands, West Midlands wedding band, West Midlands wedding bands, wedding bands in West Midlands'
          elsif @category.name == "Hair and Make-up"
            @page_title = 'Bridal Wedding Makeup Artists in West Midlands'
            @page_description = 'Find information and reviews of bridal makeup in West Midlands and also wedding hair and makeup in West Midlands'
            @page_keywords  = 'bridal makeup West Midlands, bridal hair and makeup West Midlands, wedding hair and makeup West Midlands'
          elsif @category.name == "Photographers"
            @page_title = 'Wedding Photographers in West Midlands'
            @page_description = 'Find information and reviews of wedding photographers in West Midlands and the find the perfect wedding photographer and wedding videographer for you'
            @page_keywords  = 'wedding photographer West Midlands, wedding photographers West Midlands, Wedding photography West Midlands, West Midlands wedding photographer, West Midlands wedding photographers, wedding videographer West Midlands'
          elsif @category.name == "Cakes"
            @page_title = 'West Midlands Wedding Cake Suppliers and Shops'
            @page_description = 'Find information and reviews of wedding cakes in West Midlands and find the perfect wedding cake for you'
            @page_keywords  = 'wedding cakes West Midlands, wedding cakes in West Midlands, wedding cake West Midlands, West Midlands wedding cakes'
          elsif @category.name == "Stationery"
            @page_title = 'Wedding Stationery Suppliers and Shops in West Midlands'
            @page_description = 'Find information and reviews of wedding stationery in West Midlands and find the perfect wedding invitations for you'
            @page_keywords  = 'wedding invitations West Midlands, wedding stationery West Midlands, West Midlands wedding magazine, wedding invitations in West Midlands'
          end
        when "Wales"
          if @category.name == "Florists"
            @page_title = 'Wedding Flowers and Bouquets Shops in Wales'
            @page_description = 'Find information and reviews of wedding florists in Wales and find the perfect wedding flowers for you'
            @page_keywords  = 'wedding florist Wales, wedding flowers Wales, wedding bouquets Wales, florists in Wales, flower shops in Wales'
          elsif @category.name == "Dresses"
            @page_title = 'Wedding Dresses Shops and Supplies in Wales'
            @page_description = 'Find information and reviews of wedding dresses and wedding dress shops in Wales'
            @page_keywords  = 'wedding dresses Wales, wedding dress shops Wales, wedding dress shops in Wales, Wales wedding dress shops'
          elsif @category.name == "Cars"
            @page_title = 'Wedding Cars For Hire in Wales'
            @page_description = 'Find information and reviews of wedding cars and wedding care hire in Wales'
            @page_keywords  = 'wedding car hire Wales, wedding cars Wales, Wales wedding cars, wedding cars in Wales, Wales wedding car hire'
          elsif @category.name == "Accessories"
            @page_title = 'Wedding Accessories Shops and Suppliers in Wales'
            @page_description = 'Find information and reviews of wedding accessories shops in Wales and find the perfect wedding accessories for you'
            @page_keywords  = 'wedding accessories Wales'
          elsif @category.name == "Venues"
            @page_title = 'Wales Wedding Venues For Special Day'
            @page_description = 'Find information and reviews of wedding venues in Wales'
            @page_keywords  = 'wedding venues Wales. wedding venues in Wales, Wales wedding venues, wedding venue Wales'
          elsif @category.name == "Catering"
            @page_title = 'Wedding Caterers in Wales, Catering Companies'
            @page_description = 'Find information and reviews of wedding caterers and catering companies in Wales'
            @page_keywords  = 'catering companies Wales, wedding caterers Wales, wedding catering Wales, catering companies in Wales'
          elsif @category.name == "Entertainment"
            @page_title = 'Wedding Bands in Wales'
            @page_description = 'Find information and reviews of wedding bands in Wales and hire the perfect wedding band for you'
            @page_keywords  = 'wedding band Wales, wedding bands Wales, wedding bands in Wales, Wales wedding bands'
          elsif @category.name == "Hair and Make-up"
            @page_title = 'Hire Expert Wedding Hair and Makeup Artists in Wales'
            @page_description = 'Find information and reviews of bridal makeup in Wales and also wedding hair and makeup in Wales'
            @page_keywords  = 'wedding hair and makeup Wales, bridal hair and makeup Wales, wedding hairdressers Wales, bridal makeup Wales'
          elsif @category.name == "Photographers"
            @page_title = 'Wales Wedding Photograhers and Their Photography'
            @page_description = 'Find information and reviews of wedding photographers in Wales and the find the perfect wedding photographer and wedding videographer for you'
            @page_keywords  = 'wedding photography Wales, Wales wedding photographer, wedding photographer Wales, wedding photographers Wales, wedding videographer Wales, Wales Wedding photography'
          elsif @category.name == "Cakes"
            @page_title = 'Wedding Cake Shops in Wales'
            @page_description = 'Find information and reviews of wedding cakes in Wales and find the perfect wedding cake for you'
            @page_keywords  = 'wedding cakes Wales, wedding cake Wales, wedding cakes in Wales, Wales wedding cakes'
          elsif @category.name == "Stationery"
            @page_title = 'Wedding Invitations and Stationery Supplies in Wales'
            @page_description = 'Find information and reviews of wedding stationery in Wales and find the perfect wedding invitations for you'
            @page_keywords  = 'wedding invitations Wales, wedding stationery Wales'
          end
        when "London & South East"
          if @category.name == "Florists"
            @page_title = 'Wedding Florists in London & South East, Wedding Flowers Shops'
            @page_description = 'Find information and reviews of wedding florists in London & South East and find the perfect wedding flowers and wedding bouquet for you'
            @page_keywords  = 'wedding flowers London & South East, wedding florist London & South East, wedding florists London & South East, wedding bouquets London & South East, London & South East wedding florist'
          elsif @category.name == "Dresses"
            @page_title = 'London & South East Wedding Dress Shops, Wedding Dresses Supplies'
            @page_description = 'Find information and reviews of wedding dresses and wedding dress shops in London & South East'
            @page_keywords  = 'wedding dress shops London & South East, wedding dresses shops in London & South East, wedding dresses London & South East, wedding dresses in London & South East, wedding dress shop London & South East, London & South East wedding dress shops, London & South East wedding dresses, wedding dress shops in London & South East'
          elsif @category.name == "Cars"
            @page_title = 'Wedding Cars For Hire in London & South East'
            @page_description = 'Find information and reviews of wedding cars and wedding care hire in London & South East'
            @page_keywords  = 'wedding car hire London & South East, limousine hire London & South East, wedding cars London & South East, wedding car hire in London & South East, London & South East wedding car hire, London & South East wedding cars, wedding cars in London & South East'
          elsif @category.name == "Accessories"
            @page_title = 'Bridal Wedding Accessories Shops in London & South East'
            @page_description = 'Find information and reviews of wedding accessories shops in London & South East and find the perfect bridal hair accessories for you'
            @page_keywords  = 'bridal accessories London & South East, wedding accessories London & South East, wedding accessories shop London & South East, bridal hair accessories London & South East, wedding accessories shop in London & South East'
          elsif @category.name == "Venues"
            @page_title = 'Find Perfect Wedding Venues in London & South East'
            @page_description = 'Find information and reviews of wedding venues in London & South East'
            @page_keywords  = 'wedding venues London & South East, London & South East wedding venues, wedding venues in London & South East, wedding venue London & South East, London & South East wedding venue'
          elsif @category.name == "Catering"
            @page_title = 'Hire Professional Wedding Caterers in London & South East'
            @page_description = 'Find information and reviews of wedding caterers and catering companies in London & South East'
            @page_keywords  = 'wedding caterers London & South East, London & South East catering companies, caterers in London & South East, catering companies London & South East, wedding catering London & South East, catering companies in London & South East, wedding caterers in London & South East'
          elsif @category.name == "Entertainment"
            @page_title = 'Wedding Music Bands For Hire in London & South East'
            @page_description = 'Find information and reviews of wedding bands in London & South East and hire the perfect wedding music band for you'
            @page_keywords  = 'wedding bands London & South East, wedding band London & South East, London & South East wedding band, London & South East wedding bands, wedding bands in London & South East, wedding band hire London & South East, wedding music bands London & South East'
          elsif @category.name == "Hair and Make-up"
            @page_title = 'Wedding Hairdressers and Makeup Artists in London & South East'
            @page_description = 'Find information and reviews of bridal hair and makeup in London & South East and also wedding hairdressers and makeup in London & South East'
            @page_keywords  = 'wedding hairdressers, wedding hair and makeup London & South East, bridal makeup London & South East, bridal hair and makeup London & South East, wedding hair and make-up London & South East, London & South East wedding hair and makeup, wedding hairdressers London & South East'
          elsif @category.name == "Photographers"
            @page_title = 'London & South East Wedding Photographers and Videographers'
            @page_description = 'Find information and reviews of wedding photographers in London & South East and the find the perfect wedding photographer and wedding videographer for you'
            @page_keywords  = 'wedding photographer London & South East, London & South East wedding photographer, wedding photographers London & South East, wedding videographer London & South East, wedding photographers in London & South East, wedding photographer in London & South East, wedding photography London & South East, London & South East wedding photographers, London & South East wedding photography, London & South East wedding videographer'
          elsif @category.name == "Cakes"
            @page_title = 'London & South East Wedding Cakes Suppliers and Wedding Cake Shops'
            @page_description = 'Find information and reviews of wedding cakes in London & South East and find the perfect wedding cake for you'
            @page_keywords  = 'wedding cakes London & South East, London & South East wedding cakes, wedding cake London & South East, wedding cakes in London & South East, London & South East wedding cake'
          elsif @category.name == "Stationery"
            @page_title = 'London & South East Wedding Stationery Shops, Wedding Invitations'
            @page_description = 'Find information and reviews of wedding stationery and wedding favors in London & South East and find the perfect wedding invitations for you'
            @page_keywords  = 'wedding invitations London & South East, London & South East wedding magazine, London & South East wedding stationery, wedding invitations in London & South East, wedding stuff London & South East, London & South East wedding favors, wedding stationery shops London & South East, wedding stationery London & South East, London & South East wedding invitations'
          end
      end

      @suppliers = Supplier.for_region_and_category(@region, @category)
                            .order_by_rating.includes(:reviews)
      @review_count = 0
      @suppliers.each { |supplier| @review_count += supplier.reviews.visible.count }
    else
      @category = Category.friendly.find params[:id]
      case @category.name
        when "Accessories"
          @page_title = 'Wedding accessories UK, including vintage wedding accessories'
          @page_description = 'Honest reviews of wedding accessories online including vintage wedding accessories, wedding dress accessories - pretty much all wedding accessories UK'
          @page_keywords  = 'wedding accessories, wedding accessories uk, vintage wedding accessories, wedding dress accessories, wedding accessories online, wedding accessories shop'
        when "Cakes"
          @page_title = 'Wedding cake suppliers and wedding cake shops'
          @page_description = 'Honest reviews of wedding cakes uk, including wedding cake shops and wedding cake suppliers'
          @page_keywords  = 'wedding cakes uk, wedding cake suppliers, wedding cake shops'
        when "Cars"
          @page_title = 'Classic and vintage wedding car hire or wedding car decorations'
          @page_description = 'Honest reviews of wedding car hire companies so you can hire your dream vintage wedding car or you ideal wedding car decorations'
          @page_keywords  = 'wedding car hire, wedding car, wedding car decorations, vintage wedding cars, classic wedding cars, vintage wedding car hire, classic wedding car hire'
        when "Catering"
          @page_title = 'Wedding caterers'
          @page_description = 'Honest reviews of wedding caterers and wedding catering services'
          @page_keywords  = 'wedding caterers, wedding catering services, wedding supplies uk'
        when "Dresses"
          @page_title = 'Wedding dresses UK'
          @page_description = 'Honest reviews of wedding dress shops to help brides find their dream wedding dresses UK'
          @page_keywords  = 'wedding dresses uk, wedding dress shops, wedding dress online shop, wedding dress suppliers'
        when "Entertainment"
          @page_title = 'Bands for weddings'
          @page_description = 'Honest reviews of band for weddings to assist brides in finding the best wedding bands UK'
          @page_keywords  = 'bands for weddings, wedding bands uk, wedding band hire, wedding music bands'
        when "Florists"
          @page_title = 'Wedding florists and bridal bouquets'
          @page_description = 'Honest reviews of wedding florist and bridal bouquets so that brides can have their perfect wedding flower arrangements'
          @page_keywords  = 'wedding florist, wedding florists, bridal bouquets, wedding flower arrangements'
        when "Hair and Make-up"
          @page_title = 'Bridal hair and Makeup'
          @page_description = 'Honest reviews of bridal hair and makeup suppliers'
          @page_keywords  = 'bridal hair and makeup'
        when "Photographers"
          @page_title = 'Wedding photographers'
          @page_description = 'Honest reviews of wedding photographers, including vintage wedding photography'
          @page_keywords  = 'scotland wedding photographers, London & South East wedding photographer, wedding videographer London & South East, vintage wedding photography, wedding photographer North West, wedding photographers in North West, wedding photographers North West, wedding photography Wales, wedding photography scotland, wedding photography Yorkshire, wedding photographers London & South East, wedding photography North West'
        when "Stationery"
          @page_title = 'Wedding stationery UK and handmade wedding invitations'
          @page_description = 'Honest reviews of wedding stationery UK so that brides can have their dream handmade wedding invitations and vintage wedding invitations'
          @page_keywords  = 'wedding stationery uk, wedding stationary supplier, wedding stationery suppliers uk, handmade wedding stationery, wedding invitations scotland, handmade wedding invitations uk, vintage wedding invitations uk, wedding stationery scotland, unique wedding invitations uk, wedding stationery supplies, personalised wedding favours, wedding favors uk'
        when "Venues"
          @page_title = 'Wedding venue ideas and luxury wedding venues'
          @page_description = 'Honest wedding venue reviews of wedding venues London & South East to provide inspiration and help brides find their luxury wedding venues'
          @page_keywords  = 'wedding venue London & South East, wedding venues in London & South East, London & South East wedding venues, wedding venue reviews, wedding venues in North West, luxury wedding venues, wedding venue ideas'
      end
      # @suppliers = @category.suppliers.order_by_rating.includes(:reviews)
      # @review_count = 0
      # @suppliers.each { |supplier| @review_count += supplier.reviews.visible.count }

      @suppliers = Supplier.includes(:category, :reviews, :region)
                    .where("categories.slug = ?", params[:id])
                    .references(:categories, :reviews, :region)
                    .order('rating DESC NULLS LAST')
                    .order('reviews_count DESC')

      render 'categories/show_all'
    end
  end
end
