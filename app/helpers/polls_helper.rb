module PollsHelper

    def participated?(poll)
        return true unless PollParticipation.where(poll: poll, user: current_user).blank?
    end

    def my_vote?(poll, answer)
        return true unless PollParticipation.where(user: current_user, poll: poll, poll_answer: answer).blank?
    end

    def log_in
        flash[:warning] = "please log in first" unless current_user
        redirect_to users_path unless current_user
    end

end

