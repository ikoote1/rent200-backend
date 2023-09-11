Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :owners, controllers: {
        sessions: 'api/v1/owners/sessions',
        registrations: 'api/v1/owners/registrations'
      }
    end
  end
  
end
