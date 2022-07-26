Chitraguptan::Engine.routes.draw do
  resources :dashboard, only: [:index, :update]
  root to: 'dashboard#index'
end
