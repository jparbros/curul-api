class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.boolean :approved
      t.integer :tendency
      t.integer :reply_to

      t.timestamps
    end
    add_index :comments, :commentable_id
  end
end
