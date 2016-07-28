class ComputerPlayer
  attr_accessor :memory, :first_guess, :name, :score
  def initialize(memory_size)
    @memory = Array.new(memory_size)
    @first_guess = false
    @name = "computer"
    @score = 0
  end

  def get_guess(actual_board)
    # debugger
    @first_guess ? @first_guess = false : @first_guess = true

    hidden_cards = []
    hidden_cards = find_hidden_cards(actual_board)

    all_winning_combos = []
    all_winning_combos = find_winning_combos(actual_board)


    one_card = one_card_combo_check(hidden_cards, all_winning_combos)
    return (one_card.flatten.sample + 1) unless one_card == []

    two_card = two_card_combo_check(hidden_cards, all_winning_combos)
    if two_card.length > 2

      two_card = two_card.flatten.sample
    end
    return (two_card.flatten.sample + 1) unless (two_card == [] || !@first_guess)

    hidden_cards.flatten.sample + 1

  end

  def one_card_combo_check(hidden, all_winning_combos)
    all_winning_combos.each do |combo|
      if combo.any?{|el| hidden.include?(el)}
        unless combo.all?{|el| hidden.include?(el)}
          return combo
        end
      end
    end
    return []
  end

  def two_card_combo_check(hidden, all_winning_combos)
    results = []
    all_winning_combos.each do |combo|
      return combo if combo.all?{|el| hidden.include?(el)}
    end
  end

  def find_winning_combos(actual_board)
    # p @memory
    results = []
    new_el = []
    (0...@memory.length).each do |idx|
      ((idx + 1)...(@memory.length - idx - 1)).each do |idx2|
        if @memory[idx] == @memory[idx2] && !(@memory[idx].nil? || @memory[idx2].nil?)
          new_el << idx
          new_el << idx2
          results << new_el
        end
      end
    end
  results
  # p results
  end



  def find_hidden_cards(actual_board)
    results = []
    (0...@memory.length).each do |idx|
        results << idx if actual_board[idx].hidden
    end
    results
  end




  def prompt
  end

  def peak_board(current_board)
    (0...@memory.length).each do |idx|
      unless current_board[idx].hidden
        @memory[idx] = current_board[idx].face_value
      end
    end
    # p @memory
  end


end
