require 'spec_helper'
require 'stripe_mock'

describe TransactionsController do

  # before { StripeMock.start }
  # after { StripeMock.stop }

  # describe "POST #create" do
  #   before(:each) do
  #     token = 'tok_123456'
  #     email = 'foo@example.com'

  #     @product = create(:product)

  #     charge = Stripe::Charge.create({
  #       amount: 100,
  #       currency: 'usd',
  #       card: token,
  #       description: "Test charge"
  #     })

  #     post :create, stripeEmail: email, stripeToken: token, id: @product.id
  #   end

  #   it "should assign a sale" do
  #     expect(assigns(:sale)).to_not be_nil
  #   end

  # end

end