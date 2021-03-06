Rails.application.routes.draw do

    get 'newsfeed' => 'main#newsfeed'
    get 'friends' => 'main#friends'
    get 'profile' => 'main#profile'
    get 'login' => 'main#login'
    post 'search' => 'main#search'

    resources :comments, only: [:create, :destroy]
    resources :posts do
        member do
            put 'like' => 'posts#like'
            put 'privacy' => 'posts#privacy'
        end
    end

    root to: 'main#newsfeed'
    devise_for :users do
        get '/users/sign_out' => 'devise/sessions#destroy'
    end

    get 'users/search' => 'users/search', :as => 'users_search'
    resources :users do
        member do
            get :friends
            get :followers
            get :deactivate
            put 'add_friend' => 'users#add_friend'
        end
    end

    match :follow, to: 'follows#create', as: :follow, via: :post
    match :unfollow, to: 'follows#destroy', as: :unfollow, via: :post
    match :like, to: 'likes#create', as: :like, via: :post
    match :unlike, to: 'likes#destroy', as: :unlike, via: :post

end
