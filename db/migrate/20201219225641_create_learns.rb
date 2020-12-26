class CreateLearns < ActiveRecord::Migration[6.0]
  def change
    create_table :learns do |t|
      t.text :text, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
