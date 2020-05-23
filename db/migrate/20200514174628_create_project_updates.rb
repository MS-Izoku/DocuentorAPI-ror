class CreateProjectUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :project_updates do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :updatable_id
      t.string :updatable_type

      t.string :report_number
      t.text :report_content

      t.timestamps
    end
  end
end
