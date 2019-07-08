class Api::ProductsController < ApplicationController
  def index
    if params[:search]
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all
    end

    if params[:discount]
      @products = @products.where("price < ?", 7)
    end

    if params[:sort] && params[:order] == "asc"
      @products = @products.order(:price => :asc)
    elsif params[:order] == "desc"
      @products = @products.order(:price => :desc)
    end

    render 'index.json.jb'
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      description: params[:idescription],
      image_url: params[:image_url],
      price: params[:price]
    )

    if @product.save
      render 'show.json.jb'
    else
      render 'errors.json.jb'
    end
  end

  def update
    # find the item in the db (show)
    the_id = params[:id]
    @products = Product.find_by(id: the_id)
    # modify the iem in the db (create)
    @product.name = params[:input_name],
    @product.description = params[:input_description],
    @product.image_url = params[:image_url],
    @product.price = params[:input_price]
    @product.save
    render 'update.json.jb'
  end

  def destroy
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.destroy
    render "destroy.json.jb"
  end
end
