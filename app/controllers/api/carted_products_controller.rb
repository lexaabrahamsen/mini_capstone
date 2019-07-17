class Api::CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
    status: params[:status],
    user_id: params[:user_id],
    product_id: params[:product_id],
    quantity: params[:quantity]
    )
    @carted_product.save!
    render "show.json.jb"
  end

  def index
    @carted_product = CartedProduct.all
    render "index.json.jb"
  end
end
