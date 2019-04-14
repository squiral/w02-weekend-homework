require('minitest/autorun')
require('minitest/rg')
require('../karaoke_bar.rb')
require('../guest.rb')
require('../room.rb')
require('../song.rb')
require('pry')

class TestKaraokeBar < Minitest::Test



  def setup
    @room1 = Room.new("Room 1", 15)
    @room2 = Room.new("Room 2", 10)
    @rooms = [@room1, @room2]

    @song1 = Song.new("Electrolite", "R.E.M")
    @song2 = Song.new("Livin' Thing", "Electric Light Orchestra")
    @song3 = Song.new("Reelin' In The Years", "Steely Dan")
    @songs = [@song1, @song2, @song3]

    @guest1 = Guest.new("Michael", 50.00, "Ruby Tuesday")
    @guest2 = Guest.new("Jessica", 45.00, "California Dreams")
    @guest3 = Guest.new("Sandra", 70.00, "Electrolite")
    @guest4 = Guest.new("Alison", 65.00, "Livin' Thing")
    @guest5 = Guest.new("Jason", 60.00, "The Weight")
    @guests = [@guest1, @guest2]

    @karaoke_bar = KaraokeBar.new("Sugar Cube", @rooms, 100.00, 50.00)
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
    @karaoke_bar.take_payment(@guest1)
    assert_equal(150.00, @karaoke_bar.till)
  end

  def test_take_payment__insufficient_funds
    @karaoke_bar.take_payment(@guest2)
    assert_equal(100.00, @karaoke_bar.till)
  end

  def test_check_in_guests_with_sufficient_funds
    @karaoke_bar.check_in_guests(@guests, @room1)
    assert_equal(150.00, @karaoke_bar.till)
    assert_equal(1, @room1.count_occupants)
  end

  # def test_empty_room_of_guests
  #   guests = [@guest1, @guest3, @guest4, @guest5]
  #   @karaoke_bar.check_in_guests(guests, @room1)
  #   assert_equal(4, @room1.count_occupants)
  #   @karaoke_bar.empty_room_of_guests(@room1)
  #   p @room1.occupants
  #   assert_equal(0, @room1.count_occupants)
  # end


 #  ^^^^ Only checking out every other guest (@guest1 + @guest4)??

end
