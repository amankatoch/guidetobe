class SearchSuggestionsController < ApplicationController
  def index
    data = [Supplier.all.pluck(:name), Category.all.pluck(:name), Region.all.pluck(:name)]
    data.flatten!
    render json: data, root: false
  end

  def show
    category = Category.where('name ILIKE ?', params[:search]).first
    region = Region.where('name ILIKE ?', params[:search]).first
    supplier = Supplier.where('name ILIKE ?', params[:search]).first

    if supplier
      redirect_to supplier
    elsif region
      redirect_to region
    elsif category
      redirect_to category
    else
      redirect_to :back, alert: 'Sorry we could not find anything for that search'
    end
  end
end
