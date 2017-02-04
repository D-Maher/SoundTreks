require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "should not save without latitude and longitude" do
    location = Location.new
    assert_not location.valid?
    assert_equal [:latitude, :longitude], location.error.keys
  end
end
