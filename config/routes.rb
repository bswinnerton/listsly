Rails.application.routes.draw do
  post 'digester/email' => 'digester#email'
end
