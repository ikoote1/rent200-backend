Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  namespace :api do
    namespace :v1 do
      devise_for :owners, controllers: {
        sessions: 'api/v1/owners/sessions',
        registrations: 'api/v1/owners/registrations',
        passwords: 'api/v1/owners/passwords'
      }

      resources :categories
      resources :families
      resources :periods
      resources :places
    end
  end
end
