Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users
  resources :rooms
  get "room/post", to: "rooms#post"
  root to: "home#top"
  resources :reservations
  post 'reservations/confirm'
  get 'room/search',to:'rooms#search'
  devise_scope :user do
    # get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

end
