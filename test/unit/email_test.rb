# == Schema Information
#
# Table name: emails
#
#  id         :integer(4)      not null, primary key
#  from       :string(255)
#  to         :string(255)
#  subject    :string(255)
#  text_body  :text
#  html_body  :text
#  created_at :datetime
#  updated_at :datetime
#  contact_id :integer(4)
#  message_id :integer(4)
#  device_id  :integer(4)
#

require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
