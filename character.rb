
class Character

  attr_accessor :name, :is_witch, :is_dead

  def initialize(name)
    @name = name
    @is_witch = false
    @is_dead = false
  end

end
