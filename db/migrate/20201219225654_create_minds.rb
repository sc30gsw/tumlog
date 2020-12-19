class CreateMinds < ActiveRecord::Migration[6.0]
  def change
    create_table :minds do |t|

      t.timestamps
    end
  end
end
