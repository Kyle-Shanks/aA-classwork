require_relative 'card_class'

class Board

  def initialize
    @grid = Array.new(3) { Array.new(4) }
  end

  def [](pos)
    x,y = pos
    @grid[y][x]
  end

  def size
    [@grid.length, @grid[0].length]
  end

  def populate
    arr = ((1..6).to_a*2).shuffle
    @grid.each do |row|
      row.map!{Card.new(arr.pop)}
    end
  end

  def won?
    @grid.all? do |row|
      row.all? { |card| card.face_up }
    end
  end

  def face_up_cards
    hash = Hash.new { |hash,k| hash[k] = [] }

    @grid.each_with_index do |row,i|
      row.each_with_index do |card,j|
        hash[card.value] << [j,i] if card.face_up
      end
    end

    hash
  end

  def render
    system("clear")
    puts "   0   1   2   3 "
    @grid.each_with_index do |row,idx|
      str = "#{idx} "
      row.each { |card| str += "[#{card.face_up ? card.value : "_"}] " }
      puts str
    end
  end

  def reveal (x,y)
    @grid[y][x].reveal
  end

end
