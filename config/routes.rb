require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'conversation#index'

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, skip: [:sessions]
  as :user do
    get 'login' =>      'devise/sessions#new',      as: :new_user_session
    post 'login' =>     'devise/sessions#create',   as: :user_session
    delete 'logout' =>  'devise/sessions#destroy',  as: :destroy_user_session
  end

  post 'digester/email' => 'digester#email'
  get ':conversation_name' => 'conversation#show', as: 'conversation'
end
