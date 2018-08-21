Rails.application.routes.draw do
  resources :rooms
  resources :residents
  root 'rooms#home'
end
