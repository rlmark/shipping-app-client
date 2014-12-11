class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(canonical_name: params[:canonical_name])
  end
end
