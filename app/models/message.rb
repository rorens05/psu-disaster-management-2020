class Message < ApplicationRecord
  belongs_to :student
  enum message_type: ['Reqular Message', 'SOS']
end
