Rails.application.routes.draw do
  apipie
  scope module: :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products, only: :index
      resource :basket, only: :show
    end
  end
end
