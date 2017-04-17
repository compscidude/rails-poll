FactoryGirl.define do
  factory :poll do
    author User.create(name: "Kevin")
    question "What is your favorite food?"
    status 1
  end

  factory :poll_with_answers, parent: :poll do

    transient do 
      answer_count 3
    end

    before(:create) { |poll, ev| ev.answer_count.times {|x| poll.poll_answers.build(answer: x)} }

  end
  


end
