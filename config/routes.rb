require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'conversation#index'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users

  post 'digester/email' => 'digester#email'
  get ':conversation_name' => 'conversation#show', as: 'conversation'
end
