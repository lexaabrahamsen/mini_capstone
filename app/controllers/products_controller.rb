class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )

    @product.save!

    #render "show.html.erb"
    redirect_to "/products/#{@product.id}"

    @product.save!
  end
  

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end


  def update
    @product = Product.find_by(id: params[:id])
    product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
  end

  def destroy
    #@product = Product.find_by(:id params[:id])
    @product.destroy
    redirect_to "/products"
  end
end




