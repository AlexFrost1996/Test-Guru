class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.string :question_title
      t.string :url
      t.references :question, index: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
