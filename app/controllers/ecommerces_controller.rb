class EcommercesController < ApplicationController
  before_action :check_user_sign_up
  def index

  end

  def show

  end

  private
  def check_user_sign_up
    unless  session[:current_user].present?
      redirect_to auths_path
    end
  end
end
