class CreateStarredItems < ActiveRecord::Migration[6.0]
  def change
    create_table :savables do |t|
      t.integer :user_id
      t.integer :starable_id
      t.string :starable_type

      t.timestamps
    end
  end
end
