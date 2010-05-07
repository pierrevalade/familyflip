class AddPaperclipFieldsToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :image_file_name,    :string
    add_column :contacts, :image_content_type, :string
    add_column :contacts, :image_file_size,    :integer
    add_column :contacts, :image_updated_at,   :datetime
  end

  def self.down
    remove_column :contacts, :image_file_name
    remove_column :contacts, :image_content_type
    remove_column :contacts, :image_file_size
    remove_column :contacts, :image_updated_at
  end
end
