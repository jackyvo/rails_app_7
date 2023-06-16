module Authenticable
  SECRET = "yoursecretword"

  include ActionController::HttpAuthentication::Token::ControllerMethods

  def current_user
    @current_user
  end

  def authenticate_with_token!
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      decode_data = decode_user_data(token)

      user_id = decode_data[0]["user_data"] if decode_data.present?
      @current_user = User.find_by(id: user_id)
    end
  end

  private ##

  def render_unauthorized
    render json: { errors: 'Bad credentials' }, status: :unauthorized
  end

  def encode_user_data(payload)
    JWT.encode payload, SECRET, "HS256"
  end

  def decode_user_data(token)
    begin
      JWT.decode token, SECRET, true, { algorithm: "HS256" }
    rescue => e
      puts e
    end
  end
end