Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: 'home#index'
  #get '/' => 'home#index'#home_controllerのindexを実行しなさい
  #get '/about' => 'home#about'
  root to: 'articles#index'#articleを表示していると分かりやすく捉えられる
end
