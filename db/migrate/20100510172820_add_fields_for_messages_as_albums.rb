class AddFieldsForMessagesAsAlbums < ActiveRecord::Migration
  def self.up
    rename_column :images, :album_id, :message_id
    add_column :messages, :album, :boolean
    add_column :messages, :date, :date
  end

  def self.down
    remove_column :messages, :date
    remove_column :messages, :album
    rename_column :images, :message_id
  end
end
