Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'

  post 'register', to: 'users#create'

  get 'current', to: 'identifiers#show'
  get 'next', to: 'identifiers#iterate'
  put 'current', to: 'identifiers#reset'
end
