Rails.application.routes.draw do

  root "static_pages#home"
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
  get "/wordlist", to: "wordlist#a-b"
  get "/wordlist1", to: "wordlist1#index"
  get "/c-d", to: "wordlist#c-d"
  get "/_wordlist1_arrange", to: "wordlist1#_wordlist1_arrange"
  get "/e-g", to: "wordlist#e-g"
  get "/h-k", to: "wordlist#h-k"
  get "/l-n", to: "wordlist#l-n"
  get "/o-p", to: "wordlist#o-p"
  get "/q-r", to: "wordlist#q-r"
  get "/s", to: "wordlist#s"
  get "/t", to: "wordlist#t"
  get "/u-z", to: "wordlist#u-z"
  resources :users
  resources :wordlists
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :questions
  resources :lessons
  resources :lesson_qetions
end
