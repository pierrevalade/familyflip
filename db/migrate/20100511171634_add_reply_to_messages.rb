class AddReplyToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :reply, :boolean
  end

  def self.down
    remove_column :messages, :reply
  end
end
