class CreateUserBagdes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_bagdes do |t|
      t.references :badge, foreign_key: true
      t.references :user, foreign_key: true
      t.index [:user_id, :badge_id], unique: true

      t.timestamps
    end
  end
end
