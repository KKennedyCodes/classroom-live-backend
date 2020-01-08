Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # resources :students, only: [:index, :show, :create]
  # resources :teachers , only: [:show, :create]
  
  resources :users
  resources :courses
  resources :sessions
  resources :questions
  resources :answers
  resources :statuses
  resources :codes
  resources :startlive
  # show "/sessions/:id/live", to: "sessions#live", as: "live"
  
  # get "/rentals/overdue", to: "rentals#overdue", as: "overdue"
  
  # root 'teachers#show'
end
