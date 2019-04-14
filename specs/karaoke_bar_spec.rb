require('minitest/autorun')
require('minitest/rg')
require('../karaoke_bar.rb')
require('../guest.rb')
require('../room.rb')
require('pry')

class TestKaraokeBar < Minitest::Test

  def setup
    @room_1 = Room.new("Room 1", 15)
    @room_2 = Room.new("Room 2", 10)
    rooms = [@room_1, @room_2]
    @karaoke_bar = KaraokeBar.new("Sugar Cube", rooms, 100.00, 50.00)

    @guest = Guest.new("Michael", 50.00, "Ruby Tuesday")
    @guest2 = Guest.new("Jessica", 45.00, "California Dreams")
  end

  def test_get_karaoke_bar_name
    assert_equal("Sugar Cube", @karaoke_bar.name)
  end

  def test_get_number_of_rooms
    assert_equal(2, @karaoke_bar.room_count)
  end

  def test_get_entry_fee
    assert_equal(50.00, @karaoke_bar.entry_fee)
  end

  def test_get_till
    assert_equal(100.00, @karaoke_bar.till)
  end

  def test_take_payment__sufficient_funds
    @karaoke_bar.take_payment(@guest)
    assert_equal(150.00, @karaoke_bar.till)
  end

  def test_take_payment__insufficient_funds
    @karaoke_bar.take_payment(@guest2)
    assert_equal(100.00, @karaoke_bar.till)
  end

  def test_check_in_guests
    guests = [@guest, @guest2]
    @karaoke_bar.check_in_guests(guests, @room_1)
    assert_equal(150.00, @karaoke_bar.till)
  end








end
