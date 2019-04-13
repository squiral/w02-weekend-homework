require('minitest/autorun')
require('minitest/rg')
require('../room.rb')
require('../guest.rb')
require('../song.rb')


class TestRoom < Minitest::Test

  def setup
    @song = Song.new("Ruby Tuesday", "The Rolling Stones")
    @song2 = Song.new("Take On Me", "A-ha")
    @room = Room.new("Room 1", 10)
    @guest = Guest.new("Michael", 50.00, "Ruby Tuesday")
  end

  def test_get_room_name
    assert_equal("Room 1", @room.name)
  end

  def test_add_songs_to_room
    songs = [@song, @song2]
    @room.add_songs(songs)
    assert_equal(2, @room.count_songs)
  end



end
