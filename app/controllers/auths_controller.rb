class AuthsController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def forget_password

  end
  # def validate_user
  #
  # end
  #
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render new_auth_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end


end
