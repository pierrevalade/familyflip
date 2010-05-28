class AddReadAtToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :read_at, :datetime, :default => nil
  end

  def self.down
    remove_column :contacts, :read_at
  end
end
