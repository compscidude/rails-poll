class PollsController < ApplicationController

    include PollsHelper

    before_action :log_in, only: [:create, :new]

    def index
        @Poll = Poll.all
    end
    
    def new
        @poll = Poll.new
    end

    def create
        # poll requires a current user who is logged in
        # poll requires at least 2 answers upon creation
        @poll = Poll.new    
        @poll.question = params[:question]
        @poll.create_answers(params[:answers])
        @poll.author = current_user
        if(@poll.save)
            redirect_to @poll
        else
            flash[:warning] = "Requires at least 2 options to create a poll"
            render 'new' 
        end
    end

    def show
        @poll = Poll.find(params[:id])
    end

    helper_method :participated?, :my_vote?

    private

    def poll_params
        params.permit(:question, :author)
    end
    

end
