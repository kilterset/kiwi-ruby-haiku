Rails.application.routes.draw do
  resources :submissions, only: %i( new create index )
  root to: redirect('/submissions/new')
end
