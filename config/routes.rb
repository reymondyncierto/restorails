Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  resources :reservations, only: [:create]
    resources :time_slots, only: [:new, :create, :edit, :update, :destroy]

  root "main#index"

  get "about", to: "about#index" # automatically creates about_path named route
  get "sign-up", to: "registrations#index"
  get "sign-in", to: "sessions#index"
  get "password", to: "passwords#edit"
  get "calendar/month", to: "calendar#month"
  get "calendar/week", to: "calendar#week"
  get "calendar/day", to: "calendar#day"
  get '/calendar/time_slots', to: 'calendar#time_slots'

  post "sign-up", to: "registrations#create"
  post "sign-in", to: "sessions#login"
  post "time_slot", to: "time_slots#create"

  patch "password", to: "passwords#update"

  delete "logout", to: "sessions#destroy"

end
