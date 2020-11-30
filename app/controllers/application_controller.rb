class ApplicationController < ActionController::Base
  before_action :initialize_session
  def initialize_session
    if session[:current_user].nil?
      session[:current_user] = nil
      session[:cart] ||= []
      session[:guest] = nil
    end
    if session[:data_scrape].nil?
      session[:data_scrape] = nil
    end
  end
end
