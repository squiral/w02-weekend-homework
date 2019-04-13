class Room

  attr_reader :name, :capacity, :songs, :occupants

  def initialize(name, capacity)
    @name = name
    @songs = [ ]
    @capacity = capacity
    @occupants = [ ]
  end


  def count_songs
    @songs.length
  end


  def add_songs(new_songs)
    for song in new_songs
      @songs << song
    end
  end











end
