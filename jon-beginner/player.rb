class Player
    
  def initialize
    @max_health = 20
  end

  def play_turn(warrior)
    if warrior.feel.enemy?
      warrior.attack!
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      recover?(warrior)
    end
    record_damage(warrior)
  end

  def recover?(warrior)
    if (warrior.health < @max_health) && !damaged?(warrior)
      warrior.rest!
    else
      warrior.walk!
    end
  end

  def damaged?(warrior)
    warrior.health < @health
  end

  def record_damage(warrior)
    @health = warrior.health
  end

end
