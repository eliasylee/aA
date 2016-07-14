class Card

  attr_accessor :hidden, :face_value


  def initialize(face_value)
    @face_value = face_value
    @hidden = true
  end

  def to_s
    @face_value.to_s
  end

  def ==(card1, card2)
    card1.to_s == card2.to_s
  end

  def hide
    self.hidden = true
  end

  def reveal
    self.hidden = false  
  end


end
