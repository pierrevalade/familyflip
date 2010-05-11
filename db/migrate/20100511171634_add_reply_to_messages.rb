class AddReplyToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :reply, :boolean
    # Message.all.each do |message|
    #   message.reply = false
    #   message.save
    # end
  end

  def self.down
    remove_column :messages, :reply
  end
end
