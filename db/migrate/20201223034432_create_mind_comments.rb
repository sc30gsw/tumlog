class CreateMindComments < ActiveRecord::Migration[6.0]
  def change
    create_table :mind_comments do |t|
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :mind, null: false, foreign_key: true
      t.timestamps
    end
  end
end
