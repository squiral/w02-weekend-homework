require('minitest/autorun')
require('minitest/rg')
require('../room.rb')
require('../karaoke_bar.rb')
require('../guest.rb')
require('pry')

class TestGuest < Minitest::Test

  def setup
    room_1 = Room.new("Room 1", 15)
    room_2 = Room.new("Room 2", 10)
    rooms = [room_1, room_2]
    @karaoke_bar = KaraokeBar.new("Sugar Cube", rooms, 100.00, 50.00)
    @guest = Guest.new("Michael", 50.00, "Ruby Tuesday")
    @guest2 = Guest.new("Jessica", 45.00, "California Dreams")
  end


  def test_get_guest_name
    assert_equal("Michael", @guest.name)
  end

  def test_get_guest_wallet
    assert_equal(50.00, @guest.wallet)
  end

  def test_get_guest_favourite_song
    assert_equal("Ruby Tuesday", @guest.favourite_song)
  end

  def test_sufficient_funds__true
    assert_equal(true, @guest.sufficient_funds?(@karaoke_bar.entry_fee))
  end

  def test_sufficient_funds__false
    assert_equal(false, @guest2.sufficient_funds?(@karaoke_bar.entry_fee))
  end

  def test_guest_buy_room__sufficient_funds
    assert_equal(50.00 , @guest.wallet)
    @guest.pay(@karaoke_bar.entry_fee)
    assert_equal(0.00 , @guest.wallet)
  end

  def test_guest_buy_room__insufficient_funds
    assert_equal(45.00 , @guest2.wallet)
    @guest2.pay(@karaoke_bar.entry_fee)
    assert_equal(45.00 , @guest2.wallet)
  end

  


end
