Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "ecommerces#index"
  get '/guest', to: 'auths#guest_login', as: 'guest_login'
  get '/forget_password', to: 'auths#forget_password', as: 'forget_password'
  post '/validate', to: 'auths#validate_user', as: 'validate_user'
  resources :auths
  resources :ecommerces
  resources :carts
  get '/logout', to: 'auths#log_out', as: 'logout'
  get '/add', to: 'ecommerces#add_product', as: 'add_product'

end
