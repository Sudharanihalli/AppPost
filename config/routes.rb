Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # root "app_posts#index"

  devise_for :users 
  
  resources :app_posts do
    resource :cover_image, only: [:destroy], module: :app_posts
  end

  # get "/app_posts", to: "app_posts#index", as: :app_posts
  # get "/app_posts/new", to: "app_posts#new", as: :new_app_post
  # get "/app_posts/:id", to: "app_posts#show", as: :app_post
  # patch "/app_posts/:id", to: "app_posts#update"
  # delete "/app_posts/:id", to: "app_posts#destroy"
  # get "/app_posts/:id/edit", to: "app_posts#edit", as: :edit_app_post
  # post "/app_posts",  to: "app_posts#create"


  # Defines the root path route ("/")
   root "app_posts#index"

end

