# Below are the routes for madmin
namespace :madmin do
  resources :papers
  resources :speaker_profiles
  resources :users
  resources :conferences
  resources :subscribers
  root to: "dashboard#show"
end
