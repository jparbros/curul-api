class AddActiveToLegislature < ActiveRecord::Migration
  def change
    add_column :legislatures, :active, :boolean
  end
end
