module CommonActions
  extend ActiveSupport::Concern
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in? #ログインしているかどうかを確認するメソッド
    !current_user.nil?
  end
  
end