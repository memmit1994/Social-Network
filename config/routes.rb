Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'users/search' => 'users/search' ,:as => 'users_search'
  resources :users
end
