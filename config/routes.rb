Rails.application.routes.draw do
  root 'experiments#index'
  resources :experiments do
    resources :runs, only: [:new, :create, :update]
  end
  resources :runs, only: [:show, :destroy, :edit] do
    resources :results
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
