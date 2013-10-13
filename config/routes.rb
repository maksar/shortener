Shortener::Application.routes.draw do
  root "permalinks#index"

  resources :permalinks

  get '/:id', to: 'permalinks#show', id: /.*/, as: :short
end
