# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#            user_password PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
#                          POST   /users/password(.:format)      devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#        user_registration PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                          POST   /users(.:format)               devise/registrations#create
#                     root GET    /                              top#index
#                  new_top GET    /top/new(.:format)             tops#new
#                     user GET    /users/:id(.:format)           users#show
#                    rooms GET    /rooms(.:format)               rooms#index
#                          POST   /rooms(.:format)               rooms#create
#                 new_room GET    /rooms/new(.:format)           rooms#new
#                edit_room GET    /rooms/:id/edit(.:format)      rooms#edit
#                     room PATCH  /rooms/:id(.:format)           rooms#update
#                          PUT    /rooms/:id(.:format)           rooms#update
#                          DELETE /rooms/:id(.:format)           rooms#destroy
#

Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resource :top, only: [:index]
  resources :users, only: [:show]
  resources :tours, only: [:new, :index] do
    collection do
      get 'search'
    end
  end
  resources :rooms do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  resources :resavations, only: [:create, :show, :index] do
    collection do
      get 'host'
      get 'request_to_confirm'
    end
    resources :messages, only: [:create]
    member do
      get 'submit'
    end
    collection do
      post 'bulk_create'
    end
  end
end
