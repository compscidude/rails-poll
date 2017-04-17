class CreatePollParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :poll_participations do |t|
      t.references :poll_answer, foreign_key: true
      t.references :author, foreign_key: true
      t.references :poll, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
