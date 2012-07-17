class CreateLegislatures < ActiveRecord::Migration
  def change
    create_table :legislatures do |t|
      t.string :name
      t.integer :application_id

      t.timestamps
    end
  end
end
