class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :project_id
      t.string :title
      t.text :summary

      t.timestamps
    end
  end
end
