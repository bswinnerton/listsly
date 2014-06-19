Rails.application.routes.draw do
  root to: 'conversation#index'

  post 'digester/email' => 'digester#email'
  get ':conversation_name' => 'conversation#show', as: 'conversation'
end
