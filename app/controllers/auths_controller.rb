class AuthsController < ApplicationController
  def index
    if session[:data_scrape].nil?
      file = Dir.glob("#{Rails.root}/public/product/data.csv")
      file.each do |file|
        Product.import(file)
        session[:data_scrape] = true
      end
      1.upto(200) do |i|
        Cart.create!(
            user_id: "#{i}",
            product_id: "#{i}"
        )
        end
    end
  end

  def new
    @user = User.new
  end

  def forget_password

  end

  def guest_login
    session[:guest] = true
    redirect_to ecommerces_path
  end

  def validate_user
    @user = User.where(email: params[:email], password: params[:password])
    if @user.present?
      session[:current_user] = @user
      flash[:notice] = "Welcome to the Ecommerce Website where you find everything"
      redirect_to root_path
    else
      flash[:alert] = "Please check the credentials"
      redirect_to auths_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have been register successfully Thank!"
      redirect_to auths_path
    else
      render new_auth_path
    end
  end

  def log_out
    session[:current_user].clear
    Product.destroy_all
    flash[:alert] = "you are logout from the website"
    redirect_to auths_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end

  def permit_login_params
    params.permit[:email,:password]
  end

  def check_user_sign_up
    if session[:current_user].nil?
      redirect_to auths_path
    end
  end



end
