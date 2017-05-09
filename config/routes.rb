Rails.application.routes.draw do
	devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

	namespace :api do
    resources :users, only: [:show]
		resources :comments
		resources :favorites

    # resources :events, only: [:show] do
    #   resources :comments
    # end

		get 'events', to: 'events#events_all'
		get 'events/categories', to: 'events#categories'
		get 'events/:id', to: 'events#show'
		get 'events/categories/:id', to: 'events#events_for_category'
		post 'favorites/:event_id', to: 'favorites#create'
		delete 'favorites/:event_id', to: 'favorites#destroy'
  end

	root to: 'client#index'
	get '*path', to: 'client#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
