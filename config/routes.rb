Rails.application.routes.draw do
     scope module: 'api/v1' do
      resources :pages
     end
end
