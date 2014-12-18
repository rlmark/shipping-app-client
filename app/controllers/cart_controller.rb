class CartController < ApplicationController
  include HTTParty

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
    end
  end

  # This is where the address gets displayed, and where the shipping option gets displayed.
  def show
    # do a get request to my api and set = to instance variable.
    @response = HTTParty.get('https://ship-toys-api.herokuapp.com/quotes/calculate?provider=fedex&destination_country=US&destination_state=WA&destination_city=Seattle&destination_zip=98105&package_weight=14')
  end
end
