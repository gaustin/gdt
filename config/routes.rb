GrantDeskTest::Application.routes.draw do
  root 'homepage#index'

  resources :cases, only: [:index]
end
