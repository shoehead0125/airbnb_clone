# == Route Map
#
# Prefix Verb URI Pattern Controller#Action
#   root GET  /           top#index
#

Rails.application.routes.draw do
  root 'top#index'
  resource :top, only: [:index, :new]
end
