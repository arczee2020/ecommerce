class EcommercesController < ApplicationController
  before_action :check_user_sign_up
  def index
    search
    if params[:search_name]
      debugger
      @products = Product.where("title LIKE ?", "%#{params[:search_name].titleize}%").paginate(page: params[:page], per_page: 30)
      session[:search_name].clear
    else
      @products = Product.paginate(page: params[:page], per_page: 30)
    end
  end


  def new
    @product =  Product.new
  end

  def create
    @product  =  User.find(session[:current_user][0]['id']).products.new(product_params)
    if @product.save
      session[:notice] = "Product added successfully"
      redirect_to ecommerces_path
    else
      render 'new'
    end
  end

  def show
    @products_row = Product.limit(4)
    @product =   Product.find(params[:id]) if params[:id].present?
  end

  private
  def check_user_sign_up
    if session[:current_user].nil?
      redirect_to auths_path
    end
  end

  def product_params
    params.require(:product).permit(:title,:description,:image,:price,:product_description)
  end

  def search
    session[:search_name] ||= params[:search_name]
    session[:filter] = params[:filter]
    params[:filter_option] = nil if params[:filter_option] == ""
    session[:filter_option] = params[:filter_option]
  end
end
