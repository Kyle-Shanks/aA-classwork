Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :subs, except: [:destroy]
  resources :posts, except: [:index] do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

end
