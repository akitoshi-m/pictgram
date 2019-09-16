class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: session_params[:email])
    #フォームから送信されたメールアドレスを取得し、
    #一致するユーザーがいるか検索
    if user && user.authenticate(session_params[:password])
    #ユーザーのパスワードが正しいかどうか確かめている
    #該当のメールアドレスをもつuserが存在している　
          #かつuserのパスワードが正しい場合にtrueになる
      log_in(user)
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
                      #↑form_forで指定した属性名
                                #permitは許可したい情報
  end
  
  
  def log_in(user)
    session[:user_id] = user.id  #log_inメソッドでsession[:user_id]に
                                 #ログイン情報を暗号化して保存
  end

  def log_out
    session.delete(:user_id) #Railsにもともと定義されているメソッド
    @current_user = nil
  end
end
