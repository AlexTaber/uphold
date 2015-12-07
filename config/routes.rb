Rails.application.routes.draw do
  resources :events, only: [:new, :create, :destroy]
  resources :bands, only: [:new, :create, :show, :destroy]

  root 'services#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/about' => 'services#about'
  get '/contact' => 'services#contact'
  get '/media' => 'services#media'
  get '/live' => 'services#live'
  get '/management' => 'services#management'
  get '/agency' => 'services#agency'
  get '/venue-center' => 'venues#home'
  get '/admin' => 'users#admin'
end
