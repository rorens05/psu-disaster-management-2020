class Api::V1::AuthController < ApplicationController
  def connection_test
    render json: 'yep its working'
  end
end
