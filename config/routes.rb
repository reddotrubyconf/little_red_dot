Rails.application.routes.draw do
  draw :madmin
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do
    get '/users/sign_in', to: 'pages#login'
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#landing"
  get '/me', to: 'pages#me'

  resources :papers do
    collection do
      get :submitted
    end
  end

  resources :featured_speakers do
    member do
      patch :bump_up
      patch :bump_down
    end
  end

  resources :subscribers

  resources :incoming_webhooks, path: "webhooks", only: [] do
    collection do
      post :tito
    end
  end

  resources :users, only: [:edit, :update]

  resource :conference do
    collection do
      get :schedule
      patch :schedule
    end
  end

  get '/survey', to: redirect('https://forms.gle/Pv4Cn4xQUocHDmvRA')
end
