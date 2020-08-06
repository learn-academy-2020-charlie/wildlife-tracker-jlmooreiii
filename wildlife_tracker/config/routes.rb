Rails.application.routes.draw do
  resources :sightings
  resources :animals

  get '/sightings/:start_date/:end_date' => 'sightings#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
