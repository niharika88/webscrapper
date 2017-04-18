Rails.application.routes.draw do
 # require 'api_constraints'
     scope module: 'api/v1' do
      resources :pages
     end
end
