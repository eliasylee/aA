require_relative 'card.rb'
require 'byebug'
class Board

  attr_accessor :size, :pair_size, :board

  def initialize(size, pair_size = 2)
    @size = size
    @pair_size = pair_size
    @board = []
  end

  def[](guess)
    @board[guess]
  end

  def populate
    @size.times do |i|
      @pair_size.times do |j|
        @board << Card.new(i)
      end
    end
    @board.shuffle!
  end

  def render
    @board.each do |el|
      if el.hidden
        print "X  "
      else
        print "#{el.face_value}  "
      end

    end
    puts
    (1..@board.length).each do |i|
      print "#{i}  "
    end
    puts

  end

  def won?
    @board.none? {|card| card.hidden }
  end

  def reveal(guess_pos)
    if @board[guess_pos].hidden
      @board[guess_pos].reveal
    end
  @board[guess_pos].face_value
  end
end

a = Board.new(5)
a.populate
a.render
