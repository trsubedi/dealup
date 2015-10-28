Rails.application.routes.draw do
  root to: "welcome#splash"
  #user routes
  resources :users
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "users#new", as: "sign_up"

  get "/logout",  to:  "sessions#destroy", as: "logout"

  #view page
  get "/views", to: "welcome#views", as: "views"

  get "/items", to: "items#new", as: "create_items"

  post "/items", to: "items#create"

  get "/users/:id/items", to: "users#userItems", as: "user_items"
  get "/items/:id", to: "items#show", as: "single_item"

  get "/search", to: "items#search", as: "search_items"

  get "/categories/:id/items", to: "items#index", as: "display_cat"

end
