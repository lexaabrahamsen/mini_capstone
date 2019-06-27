class ApplicationController < ActionController::Base
  #protect_from_forgery with: :null_session
  def the_product
    render 'product.json.jb'
  end
end
