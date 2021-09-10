class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, default: 0, null: false
      t.integer :level

      t.timestamps
    end
  end
end
