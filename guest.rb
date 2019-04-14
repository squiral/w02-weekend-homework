class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song = "Take On Me")
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def sufficient_funds?(cost)
    return wallet >= cost
  end


  def pay(cost)
    if sufficient_funds?(cost)
      @wallet -= cost
    end
  end

  def get_favourite_song_title
    return @favourite_song.title
  end

  def notices_favourite_song(room)
    for song in room.songs
      if song == @favourite_song
        return "HELL yeah! It's here! This is my JAAAAM! Let's GOOOO!"
      end
    end

    return "Shoot it's not here..."

  end















end
