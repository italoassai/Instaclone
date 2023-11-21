Rails.application.routes.draw do

resources :likes, only: [:create, :destroy]

  resources :comments
  devise_scope :user do

    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }


  resources :users, only: [:show]

  get "about", to: "about#index"

   get "posts/myposts"

  resources :posts

  get "up" => "rails/health#show", as: :rails_health_check




     root "posts#index"
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
