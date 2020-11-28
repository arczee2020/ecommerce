class ApplicationController < ActionController::Base
  # before_action :initialize_session

  def initialize_session
    session[:current_user]  = nil
    if session[:current_user].present?
      file = Dir.glob("#{Rails.root}/public/product/data.csv")
      file.each do |file|
        Product.import(file)
      end
    end
  end


end
