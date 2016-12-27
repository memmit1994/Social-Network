Rails.application.routes.draw do
    get 'main/newsfeed'

    resources :comments, only: [:create, :destroy]
    resources :posts

    root to: 'users#index'
    devise_for :users do
        get '/users/sign_out' => 'devise/sessions#destroy'
    end

    get 'users/search' => 'users/search', :as => 'users_search'
    resources :users do
        member do
            get :friends
            get :followers
            get :deactivate
        end
    end

    match :follow, to: 'follows#create', as: :follow, via: :post
    match :unfollow, to: 'follows#destroy', as: :unfollow, via: :post
    match :like, to: 'likes#create', as: :like, via: :post
    match :unlike, to: 'likes#destroy', as: :unlike, via: :post

end
