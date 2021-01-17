class Api::V1::MessagesController < Api::V1::ApiController
  before_action :require_user_login
  def create
    message = Message.new(message_params)
    message.student_id = @user.id
    message.message_type = 0
    message.message_type = message_params[:message_type] if message_params[:message_type].present?
    if message.save
      render json: message, status: :ok
    else
      render json: message.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(
      :recipient,
      :content,
      :message_type
    )
  end
end
