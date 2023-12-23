class CreateRollCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :roll_calls do |t|
      t.references :bill, null: false, foreign_key: true
      t.string :date
      t.string :description
      t.integer :ayes
      t.integer :nays
      t.integer :excused
      t.integer :absent
      t.integer :outcome
      t.integer :chamber

      t.timestamps
    end
  end
end
