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





end
