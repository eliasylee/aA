require_relative 'board.rb'
require_relative 'humanplayer.rb'
require_relative 'card.rb'
require_relative 'ComputerPlayer.rb'
require 'byebug'

class Game
  attr_reader :previous_guess, :game_board

  def initialize
    @game_board = Board.new(4)
    @game_board.populate
    @previous_guess = previous_guess
    @players = []
    @players << HumanPlayer.new
    computer = ComputerPlayer.new(@game_board.size * @game_board.pair_size)
    @players << computer
  end

  def switch_players!
    @players[0], @players[1] = @players[1], @players[0]
  end

  def take_turn
    show_board
    showing = []

    (1..@game_board.pair_size).each do

      player_guess = get_valid_guess
      # gets
      showing << (player_guess)
      @game_board[showing.last].reveal
      show_board

      @players.each do |player|
        if player.is_a?(ComputerPlayer)
          player.peak_board(@game_board)
        end

      end

    end

    re_hide(showing)

    sleep(0.2)
    switch_players!
  end

  def get_valid_guess
    pg = 0
    until valid_guess?(pg)
      @players[0].prompt
      pg = @players[0].get_guess(@game_board)
    end

    pg - 1
  end


  def re_hide(cards)
      temp_arr = []
      temp_arr = (cards.map{|el| @game_board[el].face_value}).sort
      cards.each_with_index do |card, idx|
        if temp_arr.count(temp_arr[idx]) == 2
          @players[0].score +=1
        else
          @game_board[card].hide
        end
      end
  end

  def show_board
    system('clear')
    game_board.render
  end




  def valid_guess?(guess)

      guess.between?(1, @game_board.size*@game_board.pair_size) && @game_board[guess - 1].hidden
  end

  def play_game

    take_turn until game_over?
    puts "Game OVER"
    puts "#{@players[0].name}: #{@players[0].score}"
    puts "#{@players[1].name}: #{@players[1].score}"
  end

  def game_over?
    @game_board.won?
  end

end


a = Game.new
a.play_game
