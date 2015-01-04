class OrdersController < ApplicationController

  def show
    # This displays on the confirmation page.
    @order = Order.find_by(number: params[:number])
  end

  def update
    #raise params.inspect
    if params[:order][:shipping_option]
      shipping_info = params[:order][:shipping_option].split(",")
      current_order.shipping_option = shipping_info[0]
      current_order.shipping_price = shipping_info[1].to_i
      current_order.save
      #raise current_order.inspect
    end
    order_form = OrderForm.new(current_order, params[:order])
    if order_form.save
      session[:order_number] = nil
      redirect_to order_path(order_form.order.number)
    end
  end
end
