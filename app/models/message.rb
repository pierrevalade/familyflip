# == Schema Information
#
# Table name: messages
#
#  id         :integer(4)      not null, primary key
#  contact_id :integer(4)
#  subject    :string(255)
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#  album      :boolean(1)
#  date       :date
#  reply      :boolean(1)
#

class Message < ActiveRecord::Base
  
  belongs_to :contact
  has_many :images
  # TODO: reject_if needs to be setup for all different type of uploads
  accepts_nested_attributes_for :images#, :reject_if => proc { |attributes| attributes['image_url'].blank? }
  
  before_validation :set_if_album
  
  validates_presence_of :contact
  # validates boolean
  validates_inclusion_of :reply, :in => [true, false]
  
  default_scope :order => 'created_at ASC'
  
  named_scope :albums, :conditions => {:album => true, :reply => false}
  
  def to_s
    subject
  end
  
  def email=(email)
    self.contact = email.contact
    self.subject = email.subject
    self.text = email.text_body
    self.reply = false
    email.attachments.each do |file|
      self.images.build(:attachment => file)
    end
  end
  
  def image
    images.first
  end
  
  def images?
    !images.empty?
  end
  
  def reply?
    reply == true
  end
  
  private
    def set_if_album
      self.album = images.empty? ? false : true
      true
    end
  
end
