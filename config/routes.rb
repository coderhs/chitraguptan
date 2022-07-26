Chitraguptan::Engine.routes.draw do
  resources :dashboard, only: [:index, :update]
end
