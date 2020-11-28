class ApplicationController < ActionController::Base
  before_action :initialize_session
  def initialize_session
    if session[:current_user].nil?
      session[:current_user] = nil
    end
  end
end
