require_relative 'board'

class EightQueensGame
  def initialize
    @board = Board.new
    @positions = []
    @queen_count = 0
  end

  def run
    while true
      round

      if game_won?
        break
      elsif game_lost?
        @board = Board.new
        @positions = []
        @queen_count = 0
      end
    end

    game_over
  end

  def round
    next_pos = selected_position
    @board.place_queen(next_pos)
    @board.remove_positions(next_pos)
    @queen_count += 1
  end

  def selected_position
    possible_moves = @board.open_positions?
    next_pos = possible_moves.shuffle.first
    @positions << next_pos
    next_pos
  end

  def game_over
    puts "Congratulations! A winning board is:"
    @board.render
    puts "Winning positions:"
    puts @positions.map { |x,y| "[#{x}, #{y}]" }.join(" ")
  end

  def game_won?
    @queen_count == 8
  end

  def game_lost?
    @board.open_positions?.empty? && @queen_count < 8
  end
end

EightQueensGame.new.run