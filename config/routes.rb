Rails.application.routes.draw do
  root "home#top"
  
  get "/login", to: "users#login_form"
  get "/signup", to: "users#signup_form"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
