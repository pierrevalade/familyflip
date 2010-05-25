class CreateVideoCalls < ActiveRecord::Migration
  def self.up
    create_table :video_calls do |t|
      t.string :user
      t.string :uuid

      t.timestamps
    end
  end

  def self.down
    drop_table :video_calls
  end
end
