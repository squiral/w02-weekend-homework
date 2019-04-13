require('minitest/autorun')
require('minitest/rg')
require('../karaoke_bar.rb')
require('../room.rb')
require('../guest.rb')
require('../song.rb')


class TestRoom < Minitest::Test

  def setup
    @song = Song.new("Ruby Tuesday", "The Rolling Stones")
    @song2 = Song.new("Take On Me", "A-ha")
    @song3 = Song.new("Bohemian Rhapsody", "Queen")

    @room = Room.new("Room 1", 3)

    @karaoke_bar = KaraokeBar.new("Sugar Cube", @room)

    @guest = Guest.new("Michael", 50.00, "Ruby Tuesday")
    @guest2 = Guest.new("Jessica", 50.00)
  end

  def test_get_room_name
    assert_equal("Room 1", @room.name)
  end

  def test_count_songs
    assert_equal(0, @room.count_songs)
  end

  def test_add_songs_to_room
    songs = [@song, @song2]
    @room.add_songs(songs)
    assert_equal(2, @room.count_songs)
    third_song = [@song3]
    @room.add_songs(third_song)
    assert_equal(3, @room.count_songs)
  end

  def test_count_occupants
    assert_equal(0, @room.count_occupants)
  end

  def test_check_in_guests
    guests = [@guest, @guest2]
    @room.check_in_guests(@karaoke_bar, guests)
    assert_equal(2, @room.count_occupants)
  end

  def test_full_capcity__true
    guest1 = Guest.new("Michael", 50.00)
    guest2 = Guest.new("Helen", 50.00)
    guest3 = Guest.new("Gregory", 50.00)
    guests = [guest1, guest2, guest3]
    @room.check_in_guests(@karaoke_bar, guests)
    assert_equal(true, @room.full_capacity?)
  end

  def test_full_capcity__false
    guest1 = Guest.new("Michael", 50.00)
    guest2 = Guest.new("Helen", 50.00)
    guests = [guest1, guest2]
    @room.check_in_guests(@karaoke_bar, guests)
    assert_equal(false, @room.full_capacity?)
  end

  def test_find_guest_by_name
    @room.check_in_guests(@karaoke_bar, [@guest])
    assert_equal("Michael", @room.find_guest_by_name(@guest))
  end

  def test_doesnt_check_in_guests_at_full_capacity
    # Capacity is 3, the 4th guest should not be checked in
    guest1 = Guest.new("Michael", 50.00)
    guest2 = Guest.new("Helen", 50.00)
    guest3 = Guest.new("Gregory", 50.00)
    guest4 = Guest.new("Louis", 50.00)
    guests = [guest1, guest2, guest3, guest4]
    @room.check_in_guests(@karaoke_bar, guests)
    assert_equal("Gregory", @room.find_guest_by_name(guest3))
    assert_equal(false, @room.find_guest_by_name(guest4))
  end





end
