class AddSubstituteToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :substitute, :string
  end
end
