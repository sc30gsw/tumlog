class CreateDaiets < ActiveRecord::Migration[6.0]
  def change
    create_table :daiets do |t|
      t.timestamps
    end
  end
end
