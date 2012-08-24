class AddPositionToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :position, :string
  end
end
