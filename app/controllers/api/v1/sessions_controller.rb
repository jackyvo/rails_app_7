module Api::V1
  class SessionsController < BaseController
    skip_before_action :authenticate_with_token!

    def create
      user_password = params[:password]
      user_email = params[:email]

      user = User.find_by(email: user_email)

      if user.present? && user.valid_password?(user_password)
        token = encode_user_data({ user_data: user.id })
        render json: { token: token }, status: 200
      else
        render json: { errors: "Invalid email or password" }, status: 422
      end
    end
  end
end