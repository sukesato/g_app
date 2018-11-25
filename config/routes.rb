Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  resources :priorities
  resources :labels, only: [:create, :destroy]
  resources :comments
  resources :users
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
