class AddTestIndexTitleLevel < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, [:title, :level], unique: true
  end
end
