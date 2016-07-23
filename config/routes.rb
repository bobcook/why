Rails.application.routes.draw do
  root "dashboard#home"

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :profiles

  resources :ask_whies do
    collection do
      get 'my_asked_why'
    end
  end

  resources :posts do
    collection do
      get 'user_posts'
    end
  end

end
