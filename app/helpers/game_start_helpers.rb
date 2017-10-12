helpers do

  def assign_roles(game)
    number_of_players = game.player_count
    number_of_witches = witch_count(game.player_count)
    #Subtracting the extra 1 due to hard assignment of alignment for priest role
    number_of_villagers = number_of_players - number_of_witches - 1
    game_alignments = alignments(number_of_witches, number_of_villagers).shuffle
    game_roles = starting_roles.slice(0..number_of_players-2)
    position = Array(0..6).shuffle
    assign_priest(position.slice!(0), game.id)
    game_roles.shuffle.each do |role|
      Player.create(game_id: game.id, role: role, alignment: game_alignments.slice!(0), position: position.slice!(0))
    end
  end

  private
    def alignments(witches_count, villager_count)
      alignment_collection = []
      witches_count.times {alignment_collection << "witch"}
      villager_count.times {alignment_collection << "villager"}
      alignment_collection
    end

    def assign_priest(position, game_id)
      Player.create(game_id: game_id, role: "Priest", alignment: "villager", position: position)
    end

    def starting_roles
      ["Judge", "Dirty Old Bastard", "Gambler", "Gravedigger", "Apprentice", "Survivalist"]
    end

    def witch_count(player_count)
      if player_count < 9
        return 2
      elsif player_count < 14
        return 3
      elsif player_count < 17
        return 4
      else
        return 5
    end
  end
end