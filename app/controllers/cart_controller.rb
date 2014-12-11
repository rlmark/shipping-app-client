class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      puts current_order.items.first.errors.inspect
      redirect_to cart_path
    end
  end

  def show

  end
end
