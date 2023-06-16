module Api::V1
  class ProductsController < BaseController
    before_action :set_brand
    before_action :set_product, only: [:destroy, :update]

    def create
      product = @brand.products.new product_params

      if product.save
        render json: product, status: :created
      else
        render json: { errors: product.errors.full_messages } , status: :unprocessable_entity
      end
    end

    def update
      if @product.update product_params
        render json: @product, status: :ok
      else
        render json: { errors: @product.errors.full_messages } , status: :unprocessable_entity
      end
    end

    def destroy
      if @product.destroy
        head :no_content
      else
        render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def product_params
      params.require(:product).permit(
        :name, :price, :sku, :isbn, :description, :brand_id
      )
    end

    def set_brand
      @brand = Brand.find params[:brand_id]
    end

    def set_product
      @product = @brand.products.find params[:id]
    end
  end
end