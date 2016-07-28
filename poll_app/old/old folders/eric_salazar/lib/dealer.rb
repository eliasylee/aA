require_relative 'player'
require_relative 'deck'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)
    @bets = {}
  end

  def place_bet(dealer, amt)
    raise Exception, "Dealer doesn't bet"
  end

  def play_hand(deck)
    until @hand.points >= 17
      @hand.hit(deck)
    end
  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    @bets.each do |player, bet|
      player.hand.beats?(@hand) ? player.pay_winnings(bet*2) : next
    end
  end
end
