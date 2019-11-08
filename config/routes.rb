Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  namespace :api do

    post "/sessions" => "sessions#create"

    get "/users" => "users#index"
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    get "/groups" => "groups#index"
    post "/groups" => "groups#create"
    get "/groups/:id" => "groups#show"
    patch "/groups/:id" => "groups#update"
    delete "/groups/:id" => "groups#destroy"

    post "/user_groups" => "user_groups#create"
    delete "/user_groups/:group_id" => "user_groups#destroy"

    get "/games" => "games#index"
    get "/games/:id" => "games#show"

    post "/user_games" => "user_games#create"
    delete "/user_games/:id" => "user_games#destroy"

    # post "/user_groups" => "user_groups#create"
    # delete "/user_groups/:id" => "user_groups#destroy"

    post "/group_games" => "group_games#create"
    delete "/group_games/:id" => "group_games#destroy"

  end
  
end
