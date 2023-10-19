Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/app_posts/new", to: "app_posts#new", as: :new_app_post
  get "/app_posts/:id", to: "app_posts#show", as: :app_post
  post "/app_posts", to: "app_posts#create", as: :app_posts


  # Defines the root path route ("/")
  root "app_posts#index"
end

