class CartController < ApplicationController
  before_action :check_user_sign_up

  def index

  end

  def create

  end

  def new

  end

  def delete

  end

  def show

  end

  private
  def check_user_sign_up
    if session[:current_user].nil?
      redirect_to auths_path
    end
  end
end
