class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new #favoriteクラスのインスタンスfavoriteを生成
    favorite.user_id = params[:topic_id] #favorite.user_idに現在ログインしているuser(current_user)のidを保存する
    favorite.topic_id = params[:topic_id] #favorite.topic_idにparams[:topic_id]を保存
    
    if favorite.save #favoriteをsaveし、条件分岐してメッセージを表示する
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
end
