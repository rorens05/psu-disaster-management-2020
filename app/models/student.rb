class Student < ApplicationRecord
  has_secure_password
  has_many :read_announcements

  enum gender: %w[Male Female]

  validates :student_id, presence: true, uniqueness: { case_sensitive: false }

  def name
    "#{first_name} #{last_name}"
  end
end
