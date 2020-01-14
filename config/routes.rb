Rails.application.routes.draw do
	devise_for :user

	resources :users,only: [:show,:index,:edit,:update]
	resources :books
    resources :favorites, only: [:create, :destroy]
	resources :book_comments, only: [:create, :destroy]
	root 'home#top'
	get 'home/about'
end