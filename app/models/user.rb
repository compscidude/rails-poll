class User < ActiveRecord::Base

    validates :name, presence: true, uniqueness: true

    # move this into a separate poll helper? 

    def participate_in_poll(poll, answer)

        # if the user has already participated in this poll
        raise ActiveRecord::RecordInvalid unless PollParticipation.where(user: self, poll: poll).blank?

        # create a poll participation model
        poll_participation = PollParticipation.new
        poll_participation.author = poll.author
        poll_participation.poll_answer = answer
        poll_participation.user = self
        poll_participation.poll = poll
        poll_participation.save

        # Increment the answer vote count 
        poll.cast_vote(answer)
    end

end


