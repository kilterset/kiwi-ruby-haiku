Rails.application.routes.draw do
  resources :submissions, only: %i( new create index ) do
    patch :approve
  end
  root to: redirect('/submissions/new')

  resources :admin, only: :index
end
