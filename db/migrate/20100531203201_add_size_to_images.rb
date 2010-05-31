class AddSizeToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :attachment_width, :integer
    add_column :images, :attachment_height, :integer
  end

  def self.down
    remove_column :images, :attachment_height
    remove_column :images, :attachment_width
  end
end
