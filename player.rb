class Player
  attr_accessor :character, :type, :living
  def initialize(character, type)
    @character = character
    @type = type
    @living = true
  end
end
