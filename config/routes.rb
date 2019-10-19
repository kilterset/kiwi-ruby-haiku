Rails.application.routes.draw do
  resources :submissions, only: %i( new create )
  root to: redirect('/submissions/new')
end
