class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
      t.string :name
      t.references :application

      t.timestamps
    end
    add_index :commissions, :application_id
  end
end
