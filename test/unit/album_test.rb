# == Schema Information
#
# Table name: albums
#
#  id         :integer(4)      not null, primary key
#  contact_id :integer(4)
#  title      :string(255)
#  date       :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
