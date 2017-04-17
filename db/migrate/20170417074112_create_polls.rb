class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.references :author, index: true
      t.string :question
      t.integer :status

      t.timestamps
    end

    add_foreign_key :poll, :users, column: :author_id 

  end
end
