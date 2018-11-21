Rails.application.routes.draw do
  resources :priorities
  resources :labels
  resources :comments
  resources :users
  resources :blogs do
  
    collection do
        post :confirm
    end
  end

end
