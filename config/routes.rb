Rails.application.routes.draw do
  root to: 'show#index'

  put 'todos', to: 'todos#update'
  delete 'todos', to: 'todos#destroy'
  #get 'edit', to: 'edit#show'


  resources :edit
  resources :todos
  resources :complete
end
