Rails.application.routes.draw do
  resources :scores
  resources :users
  get '/leaderboard', to: 'scores#leaderboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
