class TransactionsController < ApplicationController

  def new
    @product = Product.find(params[:id])
    @cost = @product.cost_for_owner(current_owner)

    if params[:query] == 'upgrade'
      @required_path = buy_path(id: @product.id, query: 'upgrade')
    else
      @required_path = buy_path(id: @product.id)
    end
  end

  def pickup
    @sale    = Sale.find_by!(guid: params[:guid])
    @product = @sale.product
  end

  def upgrade
    @sale    = Sale.find_by!(guid: params[:guid])
    @product = @sale.product
  end

  def create
    @product = Product.find(params[:id])
    cost = @product.cost_for_owner(current_owner)

    sale = Sale.create(
      product_id: @product.id,
      owner_id: current_owner.id,
      fee_amount: cost,
      email: current_owner.email,
      stripe_token: params[:stripeToken]
    )

    sale.process!
    if sale.finished?
      # check if this is an upgrade or a new sale
      if params[:query] && params[:query] == 'upgrade'
        redirect_to upgrade_url(guid: sale.guid)
      else
        redirect_to pickup_url(guid: sale.guid)
      end
    else
      flash.now[:alert] = sale.error
      render :new
    end
  end

end