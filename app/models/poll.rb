class Poll < ApplicationRecord
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  has_many :poll_answers
  has_many :poll_participations

  validates :author, presence: true
  validate :has_atleast_two_answers

  default_scope { order(created_at: :desc) } 

  def has_atleast_two_answers
    return if self.poll_answers.size >= 2
    errors.add(:error, "Poll requires at least two valid answers")
  end

  def has_proper_question
    return if self.question.strip.length > 0
    errors.add(:question, "Poll question cannot be blank spaces")
  end

  # this should be forwarded from the user
  def cast_vote(answer)
     return unless answer.present?
     answer.vote_count = answer.vote_count + 1
     answer.save
  end  

  def create_answers(answers)
     return unless answers.present?
     answers.each do |answer|
        self.poll_answers.build(answer: answer) if answer.length > 0
     end
  end

end
