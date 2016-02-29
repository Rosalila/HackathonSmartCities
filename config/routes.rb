Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :progress do
        member do
          post :save
          post :status
        end
      end
    end
  end

  resources :home
  resources :homework_payments
  resources :homeworks
  resources :paths
  resources :achievements
  resources :sections

  resources :courses do
    collection do
      get 'in_progress'
      get 'join_enrollment'
    end
  end

  resources :categories
  resource :enrollment

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", :registrations => "registrations" }

  root 'home#index'

  get '/backend/courses', to: 'backend#courses', as: 'backend_courses'
  get '/backend/balance', to: 'backend#balance', as: 'backend_balance'
  get '/backend/checked_assignments', to: 'backend#checked_assignments', as: 'backend_checked_assignments'
  get '/backend/pending_assignments', to: 'backend#pending_assignments', as: 'backend_pending_assignments'
  get '/profile/:id' => 'home#profile'
end
