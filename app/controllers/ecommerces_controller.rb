class EcommercesController < ApplicationController
  before_action :check_user_sign_up
  def index

  end

  private
  def check_user_sign_up
    if session[:current_user] > 0

    else

    end
  end
end
