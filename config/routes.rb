Rails.application.routes.draw do
  root "dashboard#home"

  post "/search", to: 'dashboard#search', as: :search_why

  post "/follow", to: 'users#follow', as: :follow
  post "/unfollow", to: 'users#unfollow', as: :unfollow

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :profiles

  resources :ask_whies do
    collection do
      get 'my_asked_why'
    end
    member do
      get 'like'
      get 'dislike'
      get 'super_like'
      get 'reshare'
    end
  end

  resources :posts do
    collection do
      get 'user_posts'
    end
    member do
      get 'like'
    end
  end

end
