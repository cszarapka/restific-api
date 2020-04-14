Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'

  post 'register', to: 'users#create'
end
