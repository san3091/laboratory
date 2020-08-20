Rails.application.routes.draw do
  root 'experiments#index'

  resources :experiments do
    resources :runs, only: [:new, :create, :update]
  end

  resources :runs, only: [:show, :destroy, :edit] do
    resources :results, except: :index
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
