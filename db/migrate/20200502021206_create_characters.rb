class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
