Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "categories#index"

  resources :pages
  resources :works
  resources :categories
  resources :groups
  resources :group_members
  
  namespace :api do
    namespace :v1 do
      get "drafts/:id/comments/" => "comments#index"
    end
  end

  resources :drafts do 
    resources :comments
  end

  resources :comments do
    resources :comments
  end



  #workshop
  get "/groups/:id/workshop" => "groups#workshop"

  #create user
	get "/signup" => "users#new"
  post "/users" => "users#create"

  #create sessions
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
