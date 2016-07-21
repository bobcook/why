Rails.application.routes.draw do
  resources :profiles
  devise_for :users

  devise_scope :user do
  end

  root "dashboard#home"
end
