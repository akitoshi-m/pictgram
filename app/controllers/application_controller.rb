class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  include CommonActions
  
  before_action :current_user
  before_action :logged_in?
end
