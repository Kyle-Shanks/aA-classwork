# Main game class
require_relative "player_class"

class Game
  attr_reader :players

  def initialize(p1=Player.new,p2=Player.new,*players)
    @players = [p1,p2,players].flatten
    @dictionary = File.readlines("dictionary.txt").map(&:strip)
    @current_player = @players.first
    @previous_player = @players.last
  end

  def next_player!
    @previous_player = @current_player
    next_idx = (eligible_players.index(@current_player)+1) % eligible_players.length
    @current_player = eligible_players[next_idx]
  end

  def eligible_players
    @players.select { |pl| pl.strikes < 5 }
  end

  def take_turn(player)
    puts "\n-- #{player.name}'s Turn --"
    guess = player.guess(@fragment)
    until valid_play?(guess)
      player.alert_invalid_guess
      guess = player.guess(@fragment)
    end
    @fragment += guess
  end

  def valid_play?(string)
    return false unless ('a'..'z').include?(string)
    @dictionary.any? { |word| word.start_with?(@fragment + string) }
  end

  def round_over?
    @dictionary.include?(@fragment)
  end

  def play_round
    @fragment = ""
    until round_over?
      take_turn(@current_player)
      next_player!
    end
    @previous_player.receive_strike
    puts "Round over. '#{@fragment}' was spelled."
    puts "#{@previous_player.name} received a strike"
    puts "#{@previous_player.name} has " + 'GHOST'[0,@previous_player.strikes]
    if @previous_player.strikes == 5
      puts "#{@previous_player.name} is out of the game!"
    end
  end

  def game_over?
    eligible_players.length <= 1
  end

  def play
    until game_over?
      play_round
      next_player! if eligible_players.length == 2
    end
    puts "Game over. #{eligible_players.first.name} wins!"
    @players.each do |pl|
      puts "#{pl.name} : " + 'GHOST'[0,pl.strikes]
    end
  end

end
