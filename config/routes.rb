Rails.application.routes.draw do

  get 'signup', to: 'static#signup', as: 'signup'
  get 'login', to: 'static#login', as: 'login'

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'

  root 'static#index'
end
