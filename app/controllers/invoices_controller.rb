class InvoicesController < ApplicationController

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])

    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
          amount: (@invoice.amount * 100).to_i,
          currency: 'GBP',
          card: token,
          description: params[:email]
      )

      @invoice.complete_payment(charge.id)
      redirect_to invoice_paid_path(@invoice)
    rescue Stripe::CardError => e
      @error = e
      render :edit
    end
  end

  def invoice_paid
  end

end