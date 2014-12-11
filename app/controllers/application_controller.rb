class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_order
    @current_order ||= Order.find_by!(number: session[:order_number])
  rescue ActiveRecord::RecordNotFound
    session[:order_number] = Order.create.number
    retry
  end
  helper_method :current_order

  def has_order?
    session[:order_number].present?
  end
  helper_method :has_order?
end
