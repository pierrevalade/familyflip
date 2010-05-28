# == Schema Information
#
# Table name: contacts
#
#  id                    :integer(4)      not null, primary key
#  first_name            :string(255)
#  last_name             :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  email                 :string(255)
#  device_id             :integer(4)
#  image_file_name       :string(255)
#  image_content_type    :string(255)
#  image_file_size       :integer(4)
#  image_updated_at      :datetime
#  cloudapp_login        :string(255)
#  cloudapp_password     :string(255)
#  cloudapp_last_file_id :integer(4)      default(0)
#  read_at               :datetime
#

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
