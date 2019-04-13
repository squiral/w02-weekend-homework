require('minitest/autorun')
require('minitest/rg')
require('../room.rb')
require('../guest.rb')
require('../song.rb')


class TestSong < Minitest::Test

  def setup
    @song = Song.new("Ruby Tuesday", "The Rolling Stones")
    @room = Room.new("Room 1", 10)
    @guest = Guest.new("Michael", 50.00, "Ruby Tuesday")
  end

  def test_get_song_title
    assert_equal("Ruby Tuesday", @song.title)
  end

  def test_get_song_artist
    assert_equal("The Rolling Stones", @song.artist)
  end




end
