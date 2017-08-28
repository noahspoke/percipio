Rails.application.routes.draw do
	# Notes
	get 'dashboard/notes/new', to: 'notes#new', as: 'new_notes'
	post 'dashboard/notes/new', to: 'notes#create', as: 'create_notes'

	get 'signup', to: 'users#new', as: 'signup'
	post 'signup', to: 'users#create', as: 'create_user'

	get 'login', to: 'sessions#new', as: 'login'
	post 'login', to: 'sessions#create', as: ''

	get 'dashboard', to: 'dashboard#index', as: 'dashboard'

	root 'static#index'
end
