class HumanPlayer
 attr_accessor :name, :score
  def initialize(name = "Christian")
    @name = name
    @score = 0
  end

  def get_guess(_)
    gets.chomp.to_i
  end

  def prompt
    puts "Please enter your guess #{@name}"
  end



end
