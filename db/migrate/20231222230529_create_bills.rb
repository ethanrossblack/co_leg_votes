class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :bill_number
      t.string :title
      t.string :description
      t.integer :bill_status
      t.integer :bill_type

      t.timestamps
    end
  end
end
