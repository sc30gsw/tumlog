class CreateEarlyComments < ActiveRecord::Migration[6.0]
  def change
    create_table :early_comments do |t|
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :early, null: false, foreign_key: true
      t.timestamps
    end
  end
end
