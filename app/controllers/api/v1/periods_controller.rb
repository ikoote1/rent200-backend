class Api::V1::PeriodsController < ApplicationController
    before_action :set_period, only: [:show, :update, :destroy]
  
    # GET /api/v1/periods
    def index
      @periods = Period.all
      render json: @periods
    end
  
    # GET /api/v1/periods/1
    def show
      render json: @period
    end
  
    # POST /api/v1/periods
    def create
      @period = Period.new(period_params)
  
      if @period.save
        render json: @period, status: :created
      else
        render json: @period.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/periods/1
    def update
      if @period.update(period_params)
        render json: @period
      else
        render json: @period.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/periods/1
    def destroy
      @period.destroy
      head :no_content
    end
  
    private
  
    def set_period
      @period = Period.find(params[:id])
    end
  
    def period_params
      params.require(:period).permit(:name)
    end
  end
  