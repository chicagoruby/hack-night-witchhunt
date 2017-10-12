require_relative 'character.rb'
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
    puts "How many players are there? Please choose between 5 and 22"
    num_player = gets.chomp.to_i

    until num_player >= 5 && num_player <= 22
      puts "Nah, I think you should choose between 5 and 22 players"
      num_player = gets.chomp.to_i
    end
    return (num_player - 1)
  end

  def assign_characters
    num = how_many_players
    char_arr = ["Priest", "Judge", "Gravedigger", "Apprentice", "Survivalist", "Dirty Old Bastart", "Gambler", "Fanatic", "Oracle", "Watchman", "Hunter", "Emissary", "Loose Cannon", "Assassin", "Nurse", "Spiritualist", "Benevolent Old Dane", "Acolyte", "Bomber", "Peeping", "Fortune Teller", "Inquisitor"]

    num.times do |i|
      @characters << Character.new(char_arr[i])
    end

  end

  def assign_witches
    chars = @characters.length
    if chars < 7
      witch_count = 1
    elsif chars < 9
      witch_count = 2
    elsif chars < 14
      witch_count = 3
    elsif chars < 17
      witch_count = 4
    else
      witch_count = 5
    end

    possible_witches = @characters.select {|c| c.name != "Priest" }
    possible_witches.sample(witch_count).each {|c| c.is_witch = true }

    p @characters.select {|c| c.is_witch == true }
  end

end

# gameplay
p game = Game.new
p game.assign_witches
