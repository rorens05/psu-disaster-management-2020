class Api::V1::AuthController < Api::V1::ApiController
  before_action :require_user_login, only: [:profile]

  def connection_test
    render json: { message: 'yep its working' }, status: :ok
  end

  def validate_id_number
    user = Student.find_by(student_id: params[:id])
    if user.present?
      render json: { message: 'ID Number has already been taken' }, status: :unprocessable_entity
    else
      render json: { message: 'Valid ID' }, status: :ok
    end
  end

  def login
    user = Student.find_by(student_id: params[:email]).try(:authenticate, params[:password])
    if user.present?
      render json: { user: user, token: encode_token({ id: user.id }) }, status: :ok
    else
      render json: 'Log in failed! Invalid student number or password.', status: :unauthorized
    end
  end

  def register
    user = Student.new(user_params)
    if user.save
      render json: { user: user, token: encode_token({ id: user.id }) }
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def profile
    render(json: @user, methods: [:name], status: :ok)
  end

  private

  def user_params
    params.require(:user).permit(
      :student_id, :first_name, :middle_name,
      :last_name, :gender, :date_of_birth,
      :contact_number, :address,
      :password, :password_confirmation
    )
  end
end
