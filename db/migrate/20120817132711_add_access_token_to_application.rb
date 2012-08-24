class AddAccessTokenToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :access_token, :string
  end
end
