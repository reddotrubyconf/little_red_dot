Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#landing"
  get '/me', to: 'pages#me'

  resources :auth do
    collection do
      get :github
    end
  end

  resources :papers do
    collection do
      get :submitted
    end
  end

  resources :subscribers
end
