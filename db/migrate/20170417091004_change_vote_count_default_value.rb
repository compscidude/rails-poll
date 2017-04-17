class ChangeVoteCountDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column_default :poll_answers, :vote_count, 0
  end
end
