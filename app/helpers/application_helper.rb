module ApplicationHelper
  include CommonActions
  
  before_action :current_user
  before_action :logged_in?
end
