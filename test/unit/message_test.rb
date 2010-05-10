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
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
