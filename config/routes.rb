Rails.application.routes.draw do
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  resources :users
  
  #"ログインする為のフォームを表示するページ"を取得する
  get    '/login',  to: 'sessions#new' 
  #新しくメールアドレスやパスワードを送信してもらいデータを元に
  #Sessionを作成する
  post   '/login',  to: 'sessions#create'
  #Sessionを削除する
  delete '/logout', to: 'sessions#destroy'
end
