Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "ecommerces#index"
  get '/signup', to: 'auths#sign_up', as: 'signup'
  get '/login', to: 'auths#login', as: 'login'
  get '/forget_password', to: 'auths#forget_password', as: 'forget_password'

end
