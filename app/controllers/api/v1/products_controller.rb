class ProductsController < ApplicationController
    before_action :set_product, only: [:show,:update, :destroy]
    
     # GET /api/v1/products

    def index
        @products = Product.all
        render json: @products
    end

     # GET /api/v1/products/1

     def show
        render json: @product
     end

     # POST /api/v1/product

    def create
        @product = product.new(product_params)

        if @product.save
            render json: @place, status: :created
        else
            render json: @product.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /api/v1/products/1

    def update
        if @product.update(product_params)
            render json: @product
        else
            render json: @product.errors, status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/peoducts/1

    def destroy
        @place.destroy
        head :no_content
    end

    private

    def set_product
        @product = Product.find(params[:id])
    end

    def product_params
        params.require(:place).permit(:name, :image, :location, :description, :price, :active, :capacity, :steering, :owner_id, :category_id, :place_id, :period_id, :family_id  )
    end
end
