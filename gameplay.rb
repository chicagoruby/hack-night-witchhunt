require 'character'
# Steps:
# 1. Set players
# 2. Randomly assign players
# 3.

class Game

  def initialize
    @characters = []
    assign_characters
  end

  def how_many_players
    puts "How many players are there?"
    num_player = gets.chomp.to_i
    return num_player
  end

  def assign_characters(num)
    char_arr = ["Priest", "Judge", "Gravedigger", "Apprentice", "Survivalist", "Dirty Old Bastart", "Gambler", "Fanatic", "Oracle", "Watchman"]

    num.times do |i|
      self.characters << Character.new(char_arr[i])
    end
  end

end

# gameplay
p Game.new(number)
