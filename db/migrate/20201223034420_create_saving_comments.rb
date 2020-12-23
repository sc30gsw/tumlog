class CreateSavingComments < ActiveRecord::Migration[6.0]
  def change
    create_table :saving_comments do |t|

      t.timestamps
    end
  end
end
