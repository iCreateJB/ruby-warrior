class Player
  def play_turn(warrior)
    if warrior.feel.enemy?
      warrior.attack!
    else
      (warrior.health < 20) ? warrior.rest! : warrior.walk!
    end
  end
end
