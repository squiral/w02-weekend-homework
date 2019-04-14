require('minitest/autorun')
require('minitest/rg')
require('../room.rb')
require('../karaoke_bar.rb')
require('../guest.rb')
require('../song.rb')
require('pry')

class TestGuest < Minitest::Test

  def setup
    @room1 = Room.new("Room 1", 15)
    @room2 = Room.new("Room 2", 10)
    @rooms = [@room1, @room2]

    @song1 = Song.new("Electrolite", "R.E.M")
    @song2 = Song.new("Livin' Thing", "Electric Light Orchestra")
    @song3 = Song.new("Making Plans For Nigel", "XTC")
    @songs = [@song1, @song2]

    @guest1 = Guest.new("Michael", 50.00, @song3)
    @guest2 = Guest.new("Jessica", 45.00, @song1)
    @guest3 = Guest.new("Alison", 65.00, @song2)

    @karaoke_bar = KaraokeBar.new("Sugar Cube", @rooms, 100.00, 50.00)
  end


  def test_get_guest_name
    assert_equal("Michael", @guest1.name)
  end

  def test_get_guest_wallet
    assert_equal(50.00, @guest1.wallet)
  end

  def test_get_guest_favourite_song
    assert_equal("Making Plans For Nigel", @guest1.get_favourite_song_title)
  end

  def test_sufficient_funds__true
    assert_equal(true, @guest1.sufficient_funds?(@karaoke_bar.entry_fee))
  end

  def test_sufficient_funds__false
    assert_equal(false, @guest2.sufficient_funds?(@karaoke_bar.entry_fee))
  end

  def test_guest_pay_sufficient_funds
    assert_equal(50.00 , @guest1.wallet)
    @guest1.pay(@karaoke_bar.entry_fee)
    assert_equal(0.00 , @guest1.wallet)
  end

  def test_guest_pay__insufficient_funds
    assert_equal(45.00 , @guest2.wallet)
    @guest2.pay(@karaoke_bar.entry_fee)
    assert_equal(45.00 , @guest2.wallet)
  end

  def test_guest_reacts_to_favourite_song_being__available
    room = Room.new("Room 1", 15)
    room.add_songs(@songs)
    assert_equal("HELL yeah! It's here! This is my JAAAAM! Let's GOOOO!", @guest3.notices_favourite_song(room))
  end

  def test_guest_reacts_to_favourite_song_being__unavailable
    room = Room.new("Room 1", 15)
    room.add_songs(@songs)
    assert_equal("Shoot it's not here...", @guest1.notices_favourite_song(room))
  end



end
