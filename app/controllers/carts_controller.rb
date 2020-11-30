class CartsController < ApplicationController
  before_action :check_user_sign_up

  def index
    @cart = Cart.all
  end

  def create

  end

  def new
    @product = "asd"
    session[:cart] << @product unless session[:cart].include?(@product)
    @cart_product_counter =  session[:cart].count
  end

  def delete
    session[:cart] = session[:cart].reject { |product| product.id == params[:id].to_i } if params[:id].present?
    @cart_product_counter =  session[:cart].count
  end

  def show
    @products_row = Product.limit(4)
    @product =   Product.find(params[:id]) if params[:id].present?
  end

  private
  def check_user_sign_up
    if session[:current_user].nil? || session[:guest_login] == true
      redirect_to auths_path
    end
  end
end
