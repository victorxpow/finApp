Rails.application.routes.draw do
root to: 'home#index'
resources :requesters do
  resources :loans, only: %i[new create]
end

resources :loans, only: %i[index show edit update]
end
