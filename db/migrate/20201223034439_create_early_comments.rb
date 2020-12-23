class CreateEarlyComments < ActiveRecord::Migration[6.0]
  def change
    create_table :early_comments do |t|

      t.timestamps
    end
  end
end
