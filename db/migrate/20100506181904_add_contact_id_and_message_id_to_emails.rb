class AddContactIdAndMessageIdToEmails < ActiveRecord::Migration
  def self.up
    add_column :emails, :contact_id, :integer
    add_column :emails, :message_id, :integer
  end

  def self.down
    remove_column :emails, :message_id
    remove_column :emails, :contact_id
  end
end
