class CreateContactProfiles < ActiveRecord::Migration
  def change
    create_table :contact_profiles do |t|
      t.string :kind
      t.string :contact

      t.timestamps
    end
  end
end
