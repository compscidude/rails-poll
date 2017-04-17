class PollAnswer < ApplicationRecord
  belongs_to :poll
  has_many :poll_participants
  validates :answer, presence: true
  
end

