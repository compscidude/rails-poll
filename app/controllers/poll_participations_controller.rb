class PollParticipationsController < ApplicationController

    include PollsHelper
    
    before_action :log_in

    def create
        poll = Poll.find(params[:poll_id])
        answer = PollAnswer.find(params[:answer_id])
        begin 
            # this is a must if you expect this function to raise exceptions
            current_user.participate_in_poll(poll, answer)
        rescue ActiveRecord::RecordInvalid
            flash[:warning] = "You cannot vote twice in the same poll"
        end

        redirect_to poll_path(poll)
    end

end
