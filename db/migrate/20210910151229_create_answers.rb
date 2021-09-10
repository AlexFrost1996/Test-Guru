class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.boolean :correct, default: false, null: false
      t.string :body
      t.references :question_id, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
