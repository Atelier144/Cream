Rails.application.routes.draw do
  root "home#top"

  get "/terms", to: "home#terms"
  get "/privacy", to: "home#privacy"
  get "/contact", to: "home#contact"
  
  get "/login", to: "users#login_form"
  get "/signup", to: "users#signup_form"

  get "/auth/twitter/callback", to: "users#twitter_callback"
  get "/auth/github/callback", to: "users#github_callback"
  post "/auth/twitter/callback/done", to: "users#twitter_post"
  post "/auth/github/callback/done", to: "users#github_post"
  get "/auth/failure", to: "users#auth_failure"

  get "/settings/profile", to: "users#profile_form"
  get "/settings/profile/done", to: "users#profile_done"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
