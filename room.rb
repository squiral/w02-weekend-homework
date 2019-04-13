class Room

  attr_reader :name, :capacity, :songs, :occupants

  def initialize(name, capacity, occupants = nil)
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

  def count_occupants
    return @occupants.count
  end


  def full_capacity?
    @occupants.count == @capacity ? true : false
  end

  def check_in_guests(karaoke_bar, guests)
    for guest in guests
      if full_capacity? == false
        guest.pay(karaoke_bar.entry_fee)
        karaoke_bar.book_room(guest)
        @occupants << guest
      end
    end
  end

  def find_guest_by_name(guest)
    for occupant in @occupants
      if occupant.name == guest.name
        return occupant.name
      end
    end

    return false

  end











end
