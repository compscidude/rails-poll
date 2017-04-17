require 'rails_helper'

RSpec.describe PollParticipation, type: :model do

  before do
    @poll = create(:poll_with_answers)
    @user = @poll.author
    @user2 = create(:user, name: "John")
  end

  describe 'user participates in the poll' do
      
      it 'user vote succesfully casted' do
          answer = @poll.poll_answers.first
          @user2.participate_in_poll(@poll, answer)
          expect(PollParticipation.all.size).to eq(1)
      end

      it 'user vote increments the vote_count of answer by 1' do
          answer = @poll.poll_answers.first
          expect { @user2.participate_in_poll(@poll, answer) }.to change {answer.vote_count}.by(1)
      end
    
  end

  describe 'user cannot participate twice in the same poll' do

    it 'should throw error when attempting to vote twice' do
          answer = @poll.poll_answers.first
          expect { 2.times { 
                @user2.participate_in_poll(@poll, answer)}
              }.to raise_error ActiveRecord::RecordInvalid
    end
    
  end

end
