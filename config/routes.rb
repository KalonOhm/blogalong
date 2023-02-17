Rails.application.routes.draw do
  root to: "pages#home"
  get '/about-us', to: "pages#about_us"
  get '/sign-up', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  resources :blogs
  resources :categories
  resources :users, except: [:new]
end
