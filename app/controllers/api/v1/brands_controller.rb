module Api::V1
  class BrandsController < BaseController
    def create
      brand = Brand.new brand_params

      if brand.save
        render json: brand, status: :created
      else
        render json: { errors: brand.errors.full_messages } , status: :unprocessable_entity
      end
    end

    def update
      brand = Brand.find params[:id]

      if brand.update brand_params
        render json: brand, status: :ok
      else
        render json: { errors: brand.errors.full_messages } , status: :unprocessable_entity
      end
    end

    private 

    def brand_params
      params.require(:brand).permit(
        :name, :description, :website, :founder_name, :founded_date,
        :status
      )
    end
  end
end
