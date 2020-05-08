Rails.application.routes.draw do
  # Use for login and autorize all resource
  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end

  Doorkeeper::OAuth::TokenResponse.send :prepend, Doorkeeper::CustomTokenResponse
  Doorkeeper::OAuth::ErrorResponse.send :prepend, Doorkeeper::CustomTokenErrorResponse
  # devise_for :users
  namespace :api, defaults: { format: :json }, path: '/api'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true), path: '/v1' do
    	devise_for :users, controllers: {
           registrations: 'api/v1/users/registrations',
       }, skip: [:sessions, :password]
      resources :sessions, only: [:create, :destroy]

      resources :projects, only: :index
    end
  end
end
