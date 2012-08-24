class AddApplicationToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :application_id, :integer
  end
end
