Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Create the get, get by id, and post endpoints
  resources :articles, only: [:index, :show, :create]

  # 405 response to delete, put, and patch actions to /article/<id>
  match '/articles/:id', to: 'application#method_not_allowed', via: [:put, :patch, :delete]
end
