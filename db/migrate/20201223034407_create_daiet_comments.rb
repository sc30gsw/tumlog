class CreateDaietComments < ActiveRecord::Migration[6.0]
  def change
    create_table :daiet_comments do |t|

      t.timestamps
    end
  end
end
