class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :album_id
      t.title :caption

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
