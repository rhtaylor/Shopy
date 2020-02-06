Rails.application.routes.draw do 
  root 'barbers#shop'  
  get 'login', to: 'customers#login'
  get 'logout', to: 'application#logout' 
  post 'login_user', to: 'customers#login_user' 
  post '/filter', to: 'haircuts#filter'
  get '/auth/facebook/callback' => 'customers#fbook'
  get 'haircuts/schedule', to: 'haircuts#index'  
  post 'customers/customer_slug/haircuts/new', to: 'haircuts#create'
  resources :haircuts
  resources :appointments
  resources :customers, param: :slug do 
    resources :haircuts, only: [:new, :show, :destroy ]
  end  
  resources :customers, param: :slug do 
    resources :appointments, only: [:new, :show]  
  end
  resources :barbers, param: :slug
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
