Rails.application.routes.draw do
  resources :submissions, only: %i( new create )
  root to: 'submissions#new'
end
