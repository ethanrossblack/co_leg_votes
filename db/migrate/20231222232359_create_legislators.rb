class CreateLegislators < ActiveRecord::Migration[7.0]
  def change
    create_table :legislators do |t|
      t.integer :party
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :nickname
      t.string :district
      t.integer :chamber

      t.timestamps
    end
  end
end
