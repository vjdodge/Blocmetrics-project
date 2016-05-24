Rails.application.routes.draw do
  resources :registered_applications

  resources :registered_applications, only: [] do
      resources :events, only: [:create]
  end

  namespace :api, defaults: { format: :json } do
     match '/events', to: 'events#preflight', via: [:options]
     resources :events, only: [:create]
   end

  devise_for :users

  get 'about' => 'welcome#about'
  root 'welcome#index'


end
