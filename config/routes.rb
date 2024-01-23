Rails.application.routes.draw do

  # Defines the root path route ("/")
  # root "posts#index"

  # >>>> THE ROUTES PRODUCE THE CRUD STEPS <<<<
  # index is where we will see all instances
  # show is where we see one instance
  get '/restaurants', to: 'restaurants#index'
  get 'restaurants/new', to: 'restaurants#new'
  post '/restaurants', to: 'restaurants#create'

  # READ: we have to move the dynamic :id to AFTER NEW bc "new" could be this dynamic valyue
  get 'restaurants/:id', to: 'restaurants#show', as: 'restaurant'
  # UPDATE a restaurant
  get 'restaurants/:id/edit', to: 'restaurants#edit'
  # UPDATE/PATCH goes to the field that has been modified and update it
  patch 'restaurants/:id', to: 'restaurants#update'
  # DELETE
  delete 'restaurants/:id', to: 'restaurants#destroy'

  # A SHORTCUT FOR EVERYTHING ABOVE
  # for CRUD we could just use the flow (but no other routes, just the crud one ABOVE)
  # resources :restaurants
  # if you want some routes only
  # resources :restaurants, only: [:create, :index, :destroy]
end
