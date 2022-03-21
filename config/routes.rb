Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1, path: 'api/v1' do
    resources :programs, only: [] do
      resources :languages, only: [:index]
      resources :rating_scales, only: [:index]
    end

    resources :primary_schools, only: [:index]

    resources :contacts, only: [:index] do
      get :system_contacts, on: :collection
    end
    resource  :mobile_tokens, only: [:update]

    resources :facilities, only: [] do
      resources :indicators, only: [:index]
    end

    resources :scorecards, only: [:show, :update] do
      resources :custom_indicators, only: [:create]
      resources :scorecard_references, only: [:create]
    end

    resources :scorecard_progresses, only: [:create]

    resources :local_ngos, only: [] do
      resources :cafs, only: [:index]
    end

    resources :users, only: [] do
      put :lock_access, on: :collection
    end

    post   "sign_in",  to: "sessions#create"
    delete "sign_out", to: "sessions#destroy"

    get "*path" => "api#routing_error"
  end

  namespace :v2, path: 'api/v2' do
    resources :programs, only: [] do
      resources :languages, only: [:index]
      resources :rating_scales, only: [:index]
    end

    resources :primary_schools, only: [:index]

    resources :contacts, only: [:index] do
      get :system_contacts, on: :collection
    end
    resource  :mobile_tokens, only: [:update]

    resources :facilities, only: [] do
      resources :indicators, only: [:index]
    end

    resources :scorecards, only: [:show, :update] do
      resources :custom_indicators, only: [:create]
      resources :scorecard_references, only: [:create]
    end

    resources :scorecard_progresses, only: [:create]

    resources :local_ngos, only: [] do
      resources :cafs, only: [:index]
    end

    resources :users, only: [] do
      put :lock_access, on: :collection
    end

    resources :profiles, only: [:index]

    post   "sign_in",  to: "sessions#create"
    delete "sign_out", to: "sessions#destroy"

    get "*path" => "api#routing_error"
  end
end
