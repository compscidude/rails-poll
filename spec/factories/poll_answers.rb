FactoryGirl.define do
  factory :poll_answer do
    sequence(:answer) { |n| "#{n}" }
    poll nil
    vote_count 1
  end
end
