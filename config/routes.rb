Rails.application.routes.draw do

  root "listings#index"

  get "/welcome" => "hello#welcome", as: "welcome"
  post "/haha" => "hello#haha", as: "haha"
 
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :edit, :index] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :listings do 
    resources :reservations, controller: "reservations", only: [:create, :new, :edit]
  end 

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  post "/search" => "listings#search"

end
