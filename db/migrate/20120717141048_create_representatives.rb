class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.text :biography
      t.date :birthday
      t.string :district
      t.string :circumscription
      t.string :phone
      t.string :email
      t.string :election_type
      t.integer :number_votes
      t.integer :region_id
      t.integer :province_id
      t.integer :political_party_id
      t.integer :substitute_id
      t.integer :legislature_id
      t.boolean :following

      t.timestamps
    end
  end
end
