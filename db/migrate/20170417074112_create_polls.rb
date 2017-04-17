class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.references :author, foreign_key: true
      t.string :question
      t.integer :status

      t.timestamps
    end
  end
end
