Rails.application.routes.draw do
  root 'services#home'

  get '/about' => 'services#about'
  get '/contact' => 'services#contact'
  get '/media' => 'services#media'
  get '/live' => 'services#live'
  get '/management' => 'services#management'
  get '/agency' => 'services#agency'
  get '/venue-center' => 'venues#home'
end
