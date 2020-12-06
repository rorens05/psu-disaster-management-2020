class Student < ApplicationRecord
  enum gender: %w[Male Female]

  def name
    "#{first_name} #{last_name}"
  end
end
