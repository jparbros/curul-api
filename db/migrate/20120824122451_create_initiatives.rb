class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :title
      t.text :description
      t.datetime :presented_at
      t.datetime :voted_at
      t.string :state
      t.integer :official_vote_up
      t.integer :official_vote_down
      t.integer :official_vote_abstentions
      t.integer :comments_count
      t.string :number
      t.integer :position
      t.string :year
      t.references :representative
      t.boolean :main

      t.timestamps
    end
    add_index :initiatives, :representative_id
  end
end
