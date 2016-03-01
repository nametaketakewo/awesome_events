Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:parovider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout
  resource :user, only: :destroy do
    get 'retire'
  end
  resources :events do
    resources :tickets, only: [:new, :create, :destroy]
  end
  match '*path' => 'application#error404', via: :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
