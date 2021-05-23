# config/routes.rb
Rails.application.routes.draw do
  root to: 'employee#index'

  get '/search' => 'employee#search'
end