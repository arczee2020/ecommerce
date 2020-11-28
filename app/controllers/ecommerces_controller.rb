class EcommercesController < ApplicationController
  before_action :check_user_sign_up
  def index
     @products = Product.paginate(page: params[:page], per_page: 30).limit(100)
  end

  def show
    @products_row = Product.limit(4)
    @product = Product.find(params[:id]) if params[:id].present?
  end

  private
  def check_user_sign_up
    unless  session[:current_user].present?
      redirect_to auths_path
    end
  end
end
