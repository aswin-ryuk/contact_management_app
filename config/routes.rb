Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :contacts, only: [:create, :update, :index]
    end
  end

  post 'webhooks/receive', to: 'webhooks#receive'

  root "api/v1/contacts#index"

end
