class Api::V1::Owners::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    def create
      super do |resource|
        if resource.persisted?
          render json: { message: 'Registration successful' }, status: :created
        else
          render json: { error: resource.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
  