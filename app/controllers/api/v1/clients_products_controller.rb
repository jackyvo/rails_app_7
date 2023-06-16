module Api::V1
  class ClientsProductsController < BaseController
    def create
      client = Client.find_by(id: params[:client_id])
      product = Product.find_by(id: params[:product_id])

      if client.nil? || product.nil?
        render_json_error("Client or product not found") and return
      end

      client.products << product

      if client.save
        render json: { status: "success", message: "Product added to client" }
      else
        render json: { status: "error", message: "Product not added to client" }
      end
    end
  end
end
