class KaraokeBar

  attr_reader :name, :rooms, :entry_fee, :till


  def initialize(name, rooms, till = 100.00, entry_fee = 50.00)
    @name = name
    @rooms = rooms
    @till = till
    @entry_fee = entry_fee
  end

  def room_count
    return @rooms.length
  end

  def book_room(guest)
    # return if over_capacity?(guest)
      if guest.pay(@entry_fee)
        @till += @entry_fee
      end
  end





end
