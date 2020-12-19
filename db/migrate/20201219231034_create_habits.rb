class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.text :text, null: false
      t.references :user, null: false, foreign_key: true
      t.references :exercise, foreign_key: true
      t.references :daiet, foreign_key: true
      t.references :learn, foreign_key: true
      t.references :saving, foreign_key: true
      t.references :mind, foreign_key: true
      t.timestamps
    end
  end
end
