class AddApplicationToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :application_id, :integer
  end
end
