require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root to: 'conversation#index'

  post 'digester/email' => 'digester#email'
  get ':conversation_name' => 'conversation#show', as: 'conversation'
end
