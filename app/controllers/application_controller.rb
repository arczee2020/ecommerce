class ApplicationController < ActionController::Base
  before_action :initialize_session

  def initialize_session
    session[:current_user] ||= {}

    if session[:current_user].count == 0
      file = Dir.glob("#{Rails.root}/public/product/data.csv")
      file.each do |file|
        Product.import(file)
      end
    end
  end


end
