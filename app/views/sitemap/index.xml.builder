xml.instruct!
xml.urlset(
  'xmlns'.to_sym => "http://www.sitemaps.org/schemas/sitemap/0.9",
  'xmlns:image'.to_sym => "http://www.google.com/schemas/sitemap-image/1.1"
) do
  @static_pages.each do |page|
    xml.url do
      xml.loc "#{page}"
      xml.changefreq("monthly")
    end
  end
  @regions.each do |region|
    xml.url do
      xml.loc "#{region_url(region)}"
      xml.changefreq("monthly")
    end
  end
  @categories.each do |category|
    xml.url do
      xml.loc "#{category_url(category)}"
      xml.changefreq("monthly")
    end
  end
  @brides.each do |bride|
    xml.url do
      xml.loc "#{bride_url(bride)}"
      xml.changefreq("monthly")
    end
  end
  @suppliers.each do |supplier|
    xml.url do
      xml.loc "#{supplier_url(supplier)}"
      xml.changefreq("monthly")
    end
  end
  @reviews.each do |review|
    xml.url do
      xml.loc "#{reviews_url(review)}"
      xml.changefreq("monthly")
    end
  end
  @posts.each do |post|
    xml.url do
      xml.loc "#{post_url(post)}"
      xml.lastmod post.updated_at.strftime("%F")
      xml.changefreq("monthly")
      #if post.image?
        #xml.image :image do
          #xml.image :loc, "#{request.protocol}#{request.host_with_port}#{post.image(:medium)}"
        #end
      #end
    end
  end
end