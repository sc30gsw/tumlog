class CreateLearnComments < ActiveRecord::Migration[6.0]
  def change
    create_table :learn_comments do |t|
      t.string :contetn, null: false
      t.references :user, null: false, foreign_key: true
      t.references :learn, null: false, foreign_key: true
      t.timestamps
    end
  end
end
