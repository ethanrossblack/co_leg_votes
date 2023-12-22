class CreateLegislatorVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :legislator_votes do |t|
      t.references :legislator, null: false, foreign_key: true
      t.references :roll_call, null: false, foreign_key: true
      t.integer :vote

      t.timestamps
    end
  end
end
