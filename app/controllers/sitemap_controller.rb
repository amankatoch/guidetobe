 class SitemapController < ApplicationController
   def index
     @static_pages = [root_url, about_url, contact_url, competition_url, advertise_with_us_url, media_url, faqs_url]
     @brides = Bride.all
     @regions = Region.all
     @categories = Category.all
     @suppliers = Supplier.all
     @posts = Post.all
     @reviews = Review.all
     respond_to do |format|
       format.xml
     end
   end
 end