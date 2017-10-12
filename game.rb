require_relative 'player'

class Game
  def initialize

    @day = 1
    @deadline = 5 # minutes
    # phases: day, night, dawn
    @phase = 1
  end

  def night(players)
    # 1. Gravedigger info
    if players.select { |player| player.character == "gravedigger"}.any?
      p "Wake the gravedigger."
    end
    # 2. Demons meddle
    # 3. Angels protect
    # 4. Witches kill
    # 5. Priest choice
    # 6. Inquisitor choice
    # 7. Bomber choice (while Bomb exists)
    # 8. Hunter choice (night following first survival)
    # 9. Watchman info (first night)
  end
end
