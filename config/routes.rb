Rails.application.routes.draw do
  root "home#top"
  
  get 'home/login_form'
  get 'home/signup_form'
  get 'home/terms'
  get 'home/privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
