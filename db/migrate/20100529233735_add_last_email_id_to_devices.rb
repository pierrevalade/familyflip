class AddLastEmailIdToDevices < ActiveRecord::Migration
  def self.up
    add_column :devices, :last_email_id, :integer, :default => 0
  end

  def self.down
    remove_column :devices, :last_email_id
  end
end
