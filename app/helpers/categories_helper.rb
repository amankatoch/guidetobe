module CategoriesHelper

  def region_category_introduction(region, category, review_count, supplier_count)
  	if category.name=="Photographers" || category.name=="Florists" || category.name=="Venues"
	  	  "There are #{review_count} reviews of #{supplier_count} #{category.name.downcase} in #{region.name}"
	elsif category.name=="Stationery" || category.name=="Hair and Make-up" || category.name=="Catering" || category.name=="Entertainment"
	  	  "There are #{review_count} reviews of #{supplier_count} #{category.name.downcase} suppliers in #{region.name}"
	elsif category.name=="Cars"
	  	  "There are #{review_count} reviews of #{supplier_count} car suppliers in #{region.name}"
	elsif category.name=="Accessories"
	  	  "There are #{review_count} reviews of #{supplier_count} accessory suppliers in #{region.name}"
    elsif category.name=="Dresses"
	  	  "There are #{review_count} reviews of #{supplier_count} dress suppliers in #{region.name}"
	elsif category.name=="Cakes"
	  	  "There are #{review_count} reviews of #{supplier_count} cake suppliers in #{region.name}"
	end
  end

  def category_introduction(category, review_count, supplier_count)
    if category.name=="Photographers" || category.name=="Florists" || category.name=="Venues"
	  	  "There are #{review_count} reviews of #{supplier_count} #{category.name.downcase} in the UK"
	elsif category.name=="Stationery" || category.name=="Hair and Make-up" || category.name=="Catering" || category.name=="Entertainment"
	  	  "There are #{review_count} reviews of #{supplier_count} #{category.name.downcase} suppliers in the UK"
	elsif category.name=="Cars"
	  	  "There are #{review_count} reviews of #{supplier_count} car suppliers in the UK"
    elsif category.name=="Dresses"
	  	  "There are #{review_count} reviews of #{supplier_count} dress suppliers in the UK"
	elsif category.name=="Accessories"
	  	  "There are #{review_count} reviews of #{supplier_count} accessory suppliers in the UK"
	elsif category.name=="Cakes"
	  	  "There are #{review_count} reviews of #{supplier_count} cake suppliers in the UK"
	end
  end

end
