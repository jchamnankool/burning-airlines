Rails.application.routes.draw do
  resources :reservations
  resources :users
  resources :flights
  resources :airplanes
  resources :sessions, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  get "/search/:from/:to", to: "flights#search"
end
