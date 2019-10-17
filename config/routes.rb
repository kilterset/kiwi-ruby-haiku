Rails.application.routes.draw do
  resources :submissions, only: %i( new only create )
  root to: 'submissions#new'
end
