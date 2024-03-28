# Below are the routes for madmin
namespace :madmin do
  resources :incoming_webhooks
  resources :featured_speakers
  resources :webhooks
  resources :papers
  resources :speaker_profiles
  resources :users
  resources :conferences
  resources :subscribers
  root to: "dashboard#show"
end
