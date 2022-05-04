Rails.application.routes.draw do
  get 'home/home'
  root 'home#home'
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "users#posts"
  get "/users/:id/posts/:id", to: "users#post"
end
