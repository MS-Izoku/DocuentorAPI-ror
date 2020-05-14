class CreateTextAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :text_areas do |t|
      t.string :title
      t.text :content
      t.string :text_areable_type
      t.integer :text_areable_id

      t.timestamps
    end
  end
end
