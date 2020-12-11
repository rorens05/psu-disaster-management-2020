class Api::V1::AnnouncementsController < Api::V1::ApiController
  before_action :require_user_login

  def index
    announcements = Announcement.all.order(created_at: :desc)
    announcements = announcements.map do |item|
      item.student_id = @user.id
      item
    end
    render(json: announcements, methods: :status, status: :ok)
  end

  def read_announcement
    read_announcement = ReadAnnouncement.new({ student_id: @user.id, announcement_id: params[:announcement_id] })
    if read_announcement.save
      render json: read_announcement, status: :ok
    else
      render json: read_announcement.errors.full_messages, status: :unprocessable_entity
    end
  end
end
