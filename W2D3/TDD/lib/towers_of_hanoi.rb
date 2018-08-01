require 'byebug'

class Game

  attr_reader :board

  def initialize
    @board = [[3,2,1],[],[]]
  end

  def play
    until won?
      begin
        from,to = make_move
        move(from,to)
      rescue InvalidMoveError
        puts "Invalid move"
        retry
      end
      render
    end
    puts "grats kiddo"
  end

  def make_move
    print "Enter from and to towers (eg. 0,1): "
    gets.strip.split(",").map(&:to_i)
  end

  def move(from, to)
    raise InvalidMoveError.new("Not valid move") unless valid_move?(from, to)
    board[to] << board[from].pop
  end

  def won?
    return true if board[1].length == 3 || board[2].length == 3
    false
  end

  def render
    size_arr = []
    (0..4).each do |num|
      if num == 0
        size_arr << ([" "]*5).join+'||'+([" "]*5).join
      elsif num == 4
        size_arr << " "+Array.new((5)*2,"=").join+" "
      else
        str1 = "  "+Array.new(3-num," ").join+Array.new(num,"*").join
        str2 = Array.new(num,"*").join+Array.new(3-num," ").join+"  "
        size_arr << str1+"**"+str2
      end
    end

    output = []
    output << (size_arr[0]+size_arr[0]+size_arr[0])
    (2).downto(0) do |num|
      output << (size_arr[board[0][num]||0]+size_arr[board[1][num]||0]+size_arr[board[2][num]||0])
    end
    output << (size_arr[4]+size_arr[4]+size_arr[4])

    output.each { |line| print line+"\n" }
    print"\n"
  end

  private

  def valid_move?(from, to)
    return true if board[to].last.nil?
    return false if board[from].last.nil?
    board[to].last > board[from].last
  end
end

class InvalidMoveError < StandardError; end
