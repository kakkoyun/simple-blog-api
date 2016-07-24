# == Route Map
#
#       Prefix Verb   URI Pattern                 Controller#Action
# api_v1_users GET    /api/v1/users(.:format)     api/v1/users#index
#              POST   /api/v1/users(.:format)     api/v1/users#create
#  api_v1_user GET    /api/v1/users/:id(.:format) api/v1/users#show
#              PATCH  /api/v1/users/:id(.:format) api/v1/users#update
#              PUT    /api/v1/users/:id(.:format) api/v1/users#update
#              DELETE /api/v1/users/:id(.:format) api/v1/users#destroy
#

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
