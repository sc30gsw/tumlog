class CreateMindComments < ActiveRecord::Migration[6.0]
  def change
    create_table :mind_comments do |t|

      t.timestamps
    end
  end
end
