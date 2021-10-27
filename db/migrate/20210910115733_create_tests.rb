class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0, null: false
      t.references :category, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
