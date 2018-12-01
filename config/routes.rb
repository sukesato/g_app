Rails.application.routes.draw do
  root to: 'tops#index'
  get '/incompletes', to: 'incompletes#index'
  devise_for :users
  resources :priorities
  resources :labels, only: [:create, :destroy]
  resources :comments
  resources :users, only: [:show]
  resources :blogs do
    resources :comments
  
    collection do
        post :confirm
    end
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
