class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :contact_id
      t.string :title
      t.datetime :date

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
