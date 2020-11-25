class ApplicationController < ActionController::Base
  before_action :initialize_session

  def initialize_session
    session[:current_user] ||= []
  end
end
