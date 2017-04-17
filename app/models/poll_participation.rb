class PollParticipation < ApplicationRecord
  belongs_to :poll_answer
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  belongs_to :poll
  belongs_to :user

  # the traffic will be redirected here with the information
  
end




