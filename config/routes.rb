Rails.application.routes.draw do
  root 'experiments#index'
  resources :experiments do
    resources :runs, only: [:new, :show, :create] do
      resources :results
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
