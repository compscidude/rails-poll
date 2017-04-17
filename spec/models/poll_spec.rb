require 'rails_helper'

RSpec.describe Poll, type: :model do
  
  before do
    @user = User.create(name: "Kevin")
    @poll = Poll.new(question: "What is your favorite pizza?")  
    @poll.author = @user
  end
  
  describe 'validation' do
    it 'should not create a poll when it has less than two answers' do
      @poll.poll_answers.build(answer: '1')
      expect(@poll).to_not be_valid
    end   

    it 'should create a poll when it has two or more answers' do
      @poll.poll_answers.build(answer: '1')
      @poll.poll_answers.build(answer: '2')
      expect(@poll).to be_valid
    end

    it 'should not create a poll when question is blank' do
      @poll.question = "    "
      expect(@poll).to_not be_valid
      expect(@poll.errors).to have_key(:question)
    end
  end

  describe 'poll automatically creates 3 answers' do
    it 'should have 3 poll answers' do
      poll = create(:poll_with_answers, answer_count: 5)
      expect(poll.poll_answers.size).to eq(5)
    end
  end
  
  

end
