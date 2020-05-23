class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.string :user_id
      t.integer :likable_id
      t.string :likable_type
      t.timestamps
    end
  end
end
