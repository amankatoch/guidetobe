class SupplierSuggestionsController < ApplicationController

  def index
    @suppliers = Supplier.all
    render json: @suppliers, each_serializer: SupplierSerializer, root: false
  end

end
