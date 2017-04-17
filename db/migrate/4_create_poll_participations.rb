class CreatePollParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :poll_participations do |t|
      t.references :poll_answer, foreign_key: true
      t.references :author, index: true
      t.references :poll, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_foreign_key :poll_participations, :users, column: :author_id 

  end
end
