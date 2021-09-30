class ChangeNameToBeNullInUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :name, :string, null: true
  end

  def down
  end
end
