class AddCloudAppFieldsToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :cloudapp_login, :string
    add_column :contacts, :cloudapp_password, :string
    add_column :contacts, :cloudapp_last_file_id, :integer, :default => 0
  end

  def self.down
    remove_column :contacts, :cloudapp_last_file_id
    remove_column :contacts, :cloudapp_password
    remove_column :contacts, :cloudapp_login
  end
end
