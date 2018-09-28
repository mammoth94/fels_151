Rails.application.routes.draw do
  root  "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/course_1", to: "users#course_1"
  get "word_list_1", to: "users#word_list_1"
  get "lesson_1", to: "users#lesson_1"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/wordlist", to: "wordlist#index"
  resources :users
  resources :wordlists
end
