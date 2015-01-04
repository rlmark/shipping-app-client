class CartController < ApplicationController
  include HTTParty

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
    end
  end

  # This is where the address gets displayed, and where the shipping option gets displayed.
  # order number saved in session is a randomnum saved to order under number, NOT the order id.
  def show
    if current_order.address
      make_address

      products = current_order.items.collect{|i| i.product }
      @weight = products.sum {|p| p.weight} #returns BigDecimal type

      @fedexresponse = httparty_get_request("fedex", @state, @city, @postal_code, @weight)
      @upsresponse = httparty_get_request("ups", @state, @city, @postal_code, @weight)
      @uspsresponse =httparty_get_request("usps", @state, @city, @postal_code, @weight)

      # Combining quotes for form
      @allresponses = @fedexresponse + @upsresponse + @uspsresponse
    end
  end

  def make_address
    @city = current_order.address.city
    @state = current_order.address.state
    @postal_code = current_order.address.postal_code
  end

  def httparty_get_request(provider, state, city, postal_code, weight)
    base_url = "https://ship-toys-api.herokuapp.com/quotes/calculate?"
    HTTParty.get(base_url + 'provider='+ provider + '&destination_country=US&destination_state=' + state + '&destination_city=' + city + '&destination_zip='+ postal_code + '&package_weight=' + weight.to_s )
  end
end
