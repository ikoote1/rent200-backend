class Api::V1::PlacesController < ApplicationController
    before_action :set_place, only: [:show, :update, :destroy]
  
    # GET /api/v1/places
    def index
      @places = Place.all
      render json: @places
    end
  
    # GET /api/v1/places/1
    def show
      render json: @place
    end
  
    # POST /api/v1/places
    def create
      @place = Place.new(place_params)
  
      if @place.save
        render json: @place, status: :created
      else
        render json: @place.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/places/1
    def update
      if @place.update(place_params)
        render json: @place
      else
        render json: @place.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/places/1
    def destroy
      @place.destroy
      head :no_content
    end
  
    private
  
    def set_place
      @place = Place.find(params[:id])
    end
  
    def place_params
      params.require(:place).permit(:name)
    end
  end
  