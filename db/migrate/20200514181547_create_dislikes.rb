class CreateDislikes < ActiveRecord::Migration[6.0]
  def change
    create_table :dislikes do |t|
      t.integer :user_id
      t.integer :dislikable_id
      t.string :dislikable_type

      t.timestamps
    end
  end
end
