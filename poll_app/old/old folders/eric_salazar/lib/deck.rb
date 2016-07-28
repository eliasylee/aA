require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    card_stack = []
    Card::SUIT_STRINGS.each do |k,_|
      Card::VALUE_STRINGS.each do |k2,_|
        card_stack << Card.new(k, k2)
      end
    end
    card_stack
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    taken = []
    n.times do
      if @cards.empty?
        raise Exception, 'not enough cards'
      end
      taken << @cards.shift
    end
    taken
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    cards.each do |card|
      @cards.push card
    end
  end
end
