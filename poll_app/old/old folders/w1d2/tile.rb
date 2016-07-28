class Tile
  attr_reader :given

  def initialize(value, given = false)
    @given = given
    @value = value
  end


  def value=(new_value)
     return nil if self.given
     @value = new_value
  end

  def to_s
    @given ? "*#{@value}" : " #{@value}"
  end
