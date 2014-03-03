GrantDeskTest::Application.routes.draw do
  root 'homepage#index'

  resources :cases, only: [:index, :update]
  resources :labels, except: [:edit, :update, :destroy, :show]
end
