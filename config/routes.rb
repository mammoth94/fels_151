Rails.application.routes.draw do
  root  "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/course_1", to: "users#course_1"
  get "/course_2", to: "users#course_2"
  get "lesson_1", to: "users#lesson_1"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/wordlist", to: "wordlist#index"
  get "/wordlist1", to: "wordlist1#index"
  get "/_wordlist_arrange", to: "wordlist#_wordlist_arrange"
  get "/_wordlist1_arrange", to: "wordlist1#_wordlist1_arrange"
  resources :users
  resources :wordlists
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
