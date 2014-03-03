GrantDeskTest::Application.routes.draw do
  root 'homepage#index'

  resources :cases, only: [:index]
  resources :labels, only: [:index]
end
