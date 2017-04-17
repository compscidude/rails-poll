require 'rails_helper'

RSpec.describe PollAnswer, type: :model do
  
  let(:poll) { create(:poll_with_answers, answer_count: 2) }

  
  describe 'poll answer validation' do
    
    it 'answer cannot be blank spaces' do
      answer = poll.poll_answers.build(answer: "   ")
      expect(answer).to_not be_valid
    end
    
  end

  describe 'poll answer vote count' do

    it 'increases vote count by one' do
        answer = poll.poll_answers.first
        expect { poll.cast_vote(answer) }.to change{ answer.vote_count }.by(1)
    end        

  end

end
