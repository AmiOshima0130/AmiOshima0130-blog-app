Rails.application.routes.draw do
devise_for :users
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#root to: 'home#index'
#get '/' => 'home#index'#home_controllerのindexを実行しなさい
#get '/about' => 'home#about'



root to: 'articles#index'#articleを表示していると分かりやすく捉えられる  

  resources :articles do  
    resources :comments, only: [:new, :create]
    
    resource :like, only: [:create, :destroy]
  end
  
  resource :profile, only: [:show, :edit, :update]
  resources :favorites, only: [:index]
end
