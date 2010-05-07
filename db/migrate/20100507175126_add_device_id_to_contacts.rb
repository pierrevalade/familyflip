class AddDeviceIdToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :device_id, :integer
  end

  def self.down
    remove_column :contacts, :device_id
  end
end
