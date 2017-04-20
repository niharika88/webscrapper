Rails.application.routes.draw do
  apipie
     scope module: 'api/v1' do
      resources :pages
     end
end
