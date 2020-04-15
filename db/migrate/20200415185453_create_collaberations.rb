class CreateCollaberations < ActiveRecord::Migration[6.0]
  def change
    create_table :collaberations do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
