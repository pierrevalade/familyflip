# == Schema Information
#
# Table name: devices
#
#  id            :integer(4)      not null, primary key
#  uuid          :string(255)
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer(4)
#  subdomain     :string(255)
#  last_email_id :integer(4)
#

require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
