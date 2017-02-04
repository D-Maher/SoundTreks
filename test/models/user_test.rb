require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save without name or email" do
    user = User.new
    assert_not user.valid?
    assert_equal [:name, :email], user.error.keys
  end
end
