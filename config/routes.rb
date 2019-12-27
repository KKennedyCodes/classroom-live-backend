Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :students, only: [:index, :show, :create]
  resources :teachers, only: [:show, :create]
  resources :courses
  resources :sessions
  resources :questions
  resources :answers
  resources :statuses
  
  # post "/rentals/:title/check-out", to: "rentals#check_out", as: "check_out"
  # get "/rentals/overdue", to: "rentals#overdue", as: "overdue"
  
  root 'teachers#show'
end
