class CreatePollAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :poll_answers do |t|
      t.string :answer
      t.references :poll, foreign_key: true
      t.integer :vote_count

      t.timestamps
    end
  end
end
