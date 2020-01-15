Rails.application.routes.draw do
	devise_for :user

	root 'home#top'
	get 'home/about'
	resources :users do
		member do
			get :following, :followers
		end
	end
	resources :books
	resources :favorites, only: [:create, :destroy]
	resources :book_comments, only: [:create, :destroy]
	resources :relationships, only: [:create, :destroy]
end