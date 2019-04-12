require('minitest/autorun')
require('minitest/rg')
require('../room.rb')
require('../guest.rb')


class TestRoom < Minitest::Test

  def setup
    @room = Room.new("Room 1", 10)
    @guest = Guest.new("Michael", 50.00, "Ruby Tuesday")
  end

  def test_get_room_name
    assert_equal("Room 1", @room.name)
  end




end
