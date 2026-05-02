class Player
  attr_accessor :name
  attr_accessor :health_points
  attr_accessor :weapons
  attr_accessor :level 
  attr_accessor :damage 
  def initialize(name,health_points,weapons,level)
    @name = name
    @health_points = health_points
    @weapons = weapons
    @level = level
    @damage = 8
  end

  def to_s
    "
    Welcome #{@name} 
    Weapons: #{@weapons}
    ❤️ #{@health_points}
    🌟Level: #{@level}
    "
  end

  def attack
    puts "Attacking"
  end

  def get_damage(enemy_damage)
    @health_points -= enemy_damage
  end

  def up_level()
    @level += 1
  end
end