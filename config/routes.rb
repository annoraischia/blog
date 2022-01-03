Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

resources :articles do
  resources :comments
end
resources :categories do
  resources :articles
end
end

  # get '/articles' => 'articles#index'

  # get '/articles/new' => 'articles#new'
  # post '/articles' => 'articles#create'

  # get '/articles/:id/edit' => 'articles#edit', as: edit_article

  # get '/articles/:id' => 'articles#show'
  # #get '/articles/two' => 'articles#two'
