class Card

  attr_accessor :value, :face_up

  def initialize(num)
    @value = num
    @face_up = false
  end

  def hide
    self.face_up = false
  end

  def reveal
    self.face_up = true
  end

  def to_s
    self.value.to_s
  end

  def ==(card)
    self.value == card.value
  end
  
end
