Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :event do
    resources :charges
  end
  resources :user
  root to: "event#index"
  
end
