Rails.application.routes.draw do
  
  resources :users
  
  root 'users#index'

  get '/display', to: "users#display"

  post '/validate', to: "users#validate"

  post '/choice', to: "users#choice"

  get '/choice', to: "users#choice"

  #get '/insert', to: "users#insert"

end
