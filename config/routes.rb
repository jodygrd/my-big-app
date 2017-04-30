Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"

  resources :pages
  resources :works
  resources :drafts


  #create user
	get "/signup" => "users#new"
  post "/users" => "users#create"

  #create sessions
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
