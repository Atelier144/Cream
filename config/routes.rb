Rails.application.routes.draw do
  root "home#top"

  get "/terms", to: "home#terms"
  get "/privacy", to: "home#privacy"
  get "/contact", to: "home#contact"
  
  get "/login", to: "users#login_form"
  get "/signup", to: "users#signup_form"
  get "/signup/done", to: "users#signup_done"
  post "/logout", to: "users#logout"

  get "/auth/twitter/callback", to: "users#twitter_callback"
  get "/auth/github/callback", to: "users#github_callback"
  post "/auth/twitter/callback/done", to: "users#twitter_post"
  post "/auth/github/callback/done", to: "users#github_post"
  get "/auth/failure", to: "users#auth_failure"

  get "/settings/profile", to: "users#profile_form"
  get "/settings/profile/done", to: "users#profile_done"
  get "/settings/skills", to: "users#skillset_form"
  post "/settings/skills/get-skill", to: "users#skillset_get_skill"
  post "/settings/skills/add-skill", to: "users#skillset_add_skill"
  get "/settings/sns", to: "users#sns_form"
  get "/settings/sns/done", to: "users#sns_done"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
