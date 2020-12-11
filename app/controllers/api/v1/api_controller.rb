class Api::V1::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def encode_token(payload)
    JWT.encode(payload, 'pngtek_solutions_2020')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'pngtek_solutions_2020', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        []
      end
    else
      []
    end
  end

  def session_api_user
    decoded_hash = decoded_token
    unless decoded_hash.empty?
      user_id = decoded_hash[0]['id']
      @user = Student.find_by(id: user_id)
    end
  end

  def require_user_login
    render json: { message: 'Unauthorized' }, status: :unauthorized unless !!session_api_user
  end
end
