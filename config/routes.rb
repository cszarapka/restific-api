Rails.application.routes.draw do
  post 'register', to: 'users#create'
end
