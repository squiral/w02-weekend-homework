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

  def take_payment(guest)
      if guest.pay(@entry_fee)
        @till += @entry_fee
      end
  end

  def check_in_guests(guests, room)
    for guest in guests
      if room.full_capacity? == false && guest.sufficient_funds?(@entry_fee) == true
        guest.pay(@entry_fee)
        @till += @entry_fee
        room.check_into_room(guest)
      end
    end
  end






end
