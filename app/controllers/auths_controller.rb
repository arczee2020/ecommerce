class AuthsController < ApplicationController

  def index
    file = Dir.glob("#{Rails.root}/public/product/data.csv")
    file.each do |file|
      Product.import(file)
    end
  end

  def new
    @user = User.new
  end

  def forget_password

  end

  def validate_user
    @user = User.where(email: params[:email], password: params[:password])
    if @user.present?
      session[:current_user].push(@user)
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end

  def permit_login_params
    params.permit[:email,:password]
  end


end
