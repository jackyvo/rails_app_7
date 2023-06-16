module Api::V1
  class BaseController < ApplicationController
    include Authenticable
    include ActionController::Serialization

    before_action :authenticate_with_token!

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from Exception do |exception|
      render json: { errors: exception.message }, status: 500
    end

    def render_json_error(message, status = 400)
      render json: { errors: [*message] }, status: status
    end
  end
end