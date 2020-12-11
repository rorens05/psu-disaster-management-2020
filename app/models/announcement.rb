class Announcement < ApplicationRecord
  has_many :read_announcements
  attr_accessor :student_id

  def status
    return false if read_announcements.where(student_id: student_id).count.positive?

    true
  end
end
