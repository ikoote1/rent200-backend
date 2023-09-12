class Api::V1::Owners::SessionsController < Devise::SessionsController
    respond_to :json
  
    def create
      super do |resource|
        if resource.persisted?
          render json: { message: 'Login successful' }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end
    end
  end
  