class AddDeviceIdToEmails < ActiveRecord::Migration
  def self.up
    add_column :emails, :device_id, :integer
  end

  def self.down
    remove_column :emails, :device_id
  end
end
