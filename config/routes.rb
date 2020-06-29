Rails.application.routes.draw do
  root 'events#index'
  get 'events/filter/past' => 'events#index', filter: 'past'
  resources :events do
    get :join, to:'events#join', as: 'join'
  end
  resource :session
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
