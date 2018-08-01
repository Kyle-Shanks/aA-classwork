# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError, TypeError
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class BadFruitError < StandardError; end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise BadFruitError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue BadFruitError
    puts "I can't eat #{maybe_fruit}!" if maybe_fruit != ""
    retry
  end
end

# PHASE 4
class YearsKnownError < StandardError; end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      raise YearsKnownError if yrs_known < 5
      raise ArgumentError if name.empty? || fav_pastime.empty?
    rescue YearsKnownError
      puts "Are you really best friends if you've only " +
        "known each other for #{yrs_known} years???"
      print "How long have you REALLY known each other? "
      yrs_known = gets.chomp.to_i
      retry
    rescue ArgumentError
      puts "You didn't provide correct arguments."

      if name.empty?
        print "Give a valid name. "
        name = gets.chomp
      end

      if fav_pastime.empty?
        print "Give a valid pastime. "
        fav_pastime = gets.chomp
      end

      retry
    end
    
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
