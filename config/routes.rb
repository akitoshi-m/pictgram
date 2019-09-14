Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  resources :users
  resources :topics
  
  #"ログインする為のフォームを表示するページ"を取得する
  get    '/login',  to: 'sessions#new' 
  #新しくメールアドレスやパスワードを送信してもらいデータを元に
  #Sessionを作成する
  post   '/login',  to: 'sessions#create'
  #Sessionを削除する
  delete '/logout', to: 'sessions#destroy'
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
end
