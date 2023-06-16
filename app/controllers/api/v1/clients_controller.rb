module Api::V1
  class ClientsController < BaseController
    def create
      client = Client.new client_params

      if client.save
        render json: client, status: :created
      else
        render json: { errors: client.errors.full_messages } , status: :unprocessable_entity
      end
    end

    private

    def client_params
      params.require(:client).permit(
        :name, :payout_rate,
        user_attributes: [:email, :password, :password_confirmation]
      )
    end
  end
end
