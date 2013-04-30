class Player
    
  def initialize
    @max_health = 20
  end

  def play_turn(warrior)
    navigate!(warrior)
    if warrior.feel(@direction).enemy?
      warrior.attack!(@direction)
    elsif warrior.feel(@direction).captive?
      warrior.rescue!(@direction)
    else
      recover?(warrior)
    end
    record_damage(warrior)
  end

  def navigate!(warrior)
    if (!warrior.feel(:backward).wall? && !@pivot) || (damaged?(warrior) && (warrior.health < @max_health/2))
      @direction = :backward
    else
      @pivot     = true
      @direction = :forward
    end
  end

  def recover?(warrior)
    if (warrior.health < @max_health) && !damaged?(warrior)
      warrior.rest!
    else
      warrior.walk!(@direction)
    end
  end

  def damaged?(warrior)
    warrior.health < @health
  end

  def record_damage(warrior)
    @health = warrior.health
  end

end
