# == Schema Information
#
# Table name: images
#
#  id         :integer(4)      not null, primary key
#  album_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
