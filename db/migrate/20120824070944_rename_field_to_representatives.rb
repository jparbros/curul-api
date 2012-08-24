class RenameFieldToRepresentatives < ActiveRecord::Migration
  def up
    rename_column :representatives, :region_id, :state_id
  end

  def down
  end
end