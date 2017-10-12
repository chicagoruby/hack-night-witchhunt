# Assumptions for simplifying the game logic:
  # Game has 7 players
  #

CHARACTER = ["priest", "judge", "gravedigger", "apprentice", "survivalist", "dirty old bastard"]
TYPES = ["peasant", "witch"]

class Game
  attr_accessor :players, :living_players, :day, :winning_team

  def initialize
    @day = 0
    @players = {}
    generate_players

    @living_players = @players.dup

    @players.each do |key, player|
      assign_type(player)
    end

    start_game
  end

  def start_game
    @day += 1
    puts "#############################################"
    puts "It is now day #{day}. Select a player to kill:"
    puts "#############################################"

    prompt_kill

    @choice = gets.chomp.to_i
    while @choice > 5 || @choice < 0
      puts "Invalid input. Select a player to kill:"
      prompt_kill
      @choice = gets.chomp.to_i
    end

    puts "The group attempts to kill player #{@choice}"
    attempt_kill(@players[@choice])

    @living_players = @players.select { |key, player| player.mortality == :alive }

    if !game_over?
      loop_game
    else
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "#{@winning_team} win!"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end
  end

  private

  def generate_players
    i = 0
    CHARACTER.shuffle.each do |role|
      @players[i] = Player.new(role)
      i += 1
    end
  end

  def assign_type(player)
    if player.role == "priest"
      player.type = "clergy"
    else
      if @players.values.select { |player| player.type == "witch" }.count == 2
        player.type = "peasant"
      else
        player.type = TYPES.sample
      end
    end
  end

  def prompt_kill
    @living_players.each do |key, player|
      puts "Player #{key}"
    end
  end

  def attempt_kill(player)
    @players[@choice].num_lives -= 1

    if @players[@choice].num_lives == 0
      @players[@choice].mortality = :dead
      puts "Player #{@choice} is gruesomely killed"
    end
  end

  def game_over?
    living_witches = @living_players.select { |key, player| player.type == "witch" }
    living_peasants = @living_players.select { |key, player| player.type == "peasant" || player.type == "clergy" }

    if living_witches.keys.count == 0
      @winning_team = "Peasants"
    elsif living_peasants.keys.count == 0
      @winning_team = "Witches"
    end

    living_witches.keys.count == 0 || living_peasants.keys.count == 0
  end

  def loop_game
    start_game
  end
end

class Player
  attr_accessor :role, :type, :mortality, :num_lives

  def initialize(role)
    @role = role
    @mortality = :alive
    @num_lives = role == "survivalist" ? 2 : 1
  end
end

game = Game.new
p game.players
