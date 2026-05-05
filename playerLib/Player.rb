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
    "Welcome #{@name} Weapons: #{@weapons} ❤️ #{@health_points} 🌟Level: #{@level}"
  end

  def get_damage(enemy_damage)
    @health_points -= enemy_damage 
  end

  def up_level
    @level += 1 
  end

  # def heavy_attack(enemy_health_points)
  #   player_damage = @damage*2
  #   enemy_health_points -= player_damage    
  # end

  # def fast_atacck
  #   random = [true,false]
  # end
end