class ReadAnnouncement < ApplicationRecord
  belongs_to :announcement
  belongs_to :student
end
