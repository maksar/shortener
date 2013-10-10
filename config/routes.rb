Shortener::Application.routes.draw do
  root "permalinks#index"

  resources :permalinks
end
