require_relative 'player'
require_relative 'game'

game = Game.new

num_players = 0
num_witches = 0
num_clergy = 1
players = []

while num_players < 7 do
  puts "How many players? (7 players required)"
  num_players = gets.chomp.to_i
end

case num_players
  when 7..8
    num_witches = 2
  when 9..13
    num_witches = 3
  when 14..16
    num_witches = 4
  else
    num_witches = 5
    num_clergy = 2
end

puts "There are #{num_players} players, #{num_witches} witches, and #{num_clergy} acolytes."

characters = [
                "moderator",
                "priest",
                "judge",
                "gravedigger",
                "apprentice",
                "survivalist",
                "dirty_ol_bastard",
                "gambler",
                "fanatic",
                "oracle",
                "watchman",
                "hunter",
                "emissary",
                "bonus",
                "bonus",
                "bonus",
                "acolyte"
              ]
types = [ "villager", "witch", "clergy member" ]

# initialize player array
k = 0
while k < num_players do
  if characters[k] === "priest"
    players[k] = Player.new(characters[k], "clergy member")
  else
    players[k] = Player.new(characters[k], "villager")
  end
  k += 1
end

# randomize witches
j = 0
while j < num_witches do
  temp = players.index(players.sample())
  if players[temp].type != "witch" && players[temp].character != "priest"
    players[temp].type = "witch"
    j += 1
  end
end

# print players
i = 0
while i < num_players do
  puts "Player #{i + 1} is a #{players[i].character} and a #{players[i].type}."
  i += 1
end

#p players

game.night(players)

#p players.select { |player| player.character == "gravedigger"}
