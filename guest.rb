class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song = "Take on Me")
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















end
