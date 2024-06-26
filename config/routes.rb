Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#show"
  resource :login, only: [:new, :create, :destroy]
  resources :weighings, only: [:index, :destroy, :create, :edit, :update]
  put "/language/:code", to: "application#change_language"
  get "/backup", to: "weighings#backup"
  resource :signup, only: [:new, :create]
  get "/confirm/:secret", to: "signups#confirm", as: :confirm_signup
  resources :users, only: [:destroy]
end


