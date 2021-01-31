Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/quiz', to: 'quiz#index'
  get '/quiz/:id', to: 'quiz#show'
  post '/quiz', to: 'quiz#create'
  delete '/quiz/:id', to: 'quiz#delete'
  put '/quiz/:id', to: 'quiz#update'
end
