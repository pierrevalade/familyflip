class AddSubdomainToDevices < ActiveRecord::Migration
  def self.up
    add_column :devices, :subdomain, :string
  end

  def self.down
    remove_column :devices, :subdomain
  end
end
