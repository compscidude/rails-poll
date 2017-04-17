require 'rails_helper'

RSpec.describe PollParticipationsController, type: :controller do

    describe 'POST #create' do

        let(:poll) { create(:poll_with_answers) }
        let(:user) { create(:user) }
        let(:answer) { poll.poll_answers.first }

        subject { post :create, params: { poll_id: poll.id, answer_id: answer.id } }

        context 'with valid actions' do

            it 'should increment poll participation by 1' do                    # Count is a method of PollPrticipation
                expect{ user.participate_in_poll(poll, answer) }.to change(PollParticipation, :count).by(1)
                expect(subject.request.flash[:error]).to be_nil # no error messages
            end
        end
        
        context 'with invalid actions' do

            it 'flash error message when voting twice' do
                # has already participated in poll
                user.participate_in_poll(poll, answer)
                post :create, params: { poll_id: poll.id, answer_id: answer.id }
                expect(subject.request.flash[:error]).to_not be_nil 
                expect(response.code).to eq('302') #303 is a redirect
            end
        end
    end 

end
