require_relative 'Game.rb'

class Player
  DEFAULT_HEALTH_POINTS = 100
  DEFAULT_WEAPON = ['silver sword']
  INITIAL_LEVEL = 1
  DEFAULT_DAMAGE = 8
  attr_accessor :name
  attr_accessor :health_points
  attr_accessor :weapons
  attr_accessor :level 
  attr_accessor :damage 
  def initialize(name)
    @name = name
    @health_points = DEFAULT_HEALTH_POINTS
    @weapons = DEFAULT_WEAPON
    @level = INITIAL_LEVEL
    @damage = DEFAULT_DAMAGE
  end
  def to_s
    "Welcome #{@name}\nweapons: #{@weapons}\n ❤️ #{@health_points}\n🌟 Level: #{@level}"
  end
  
  def get_damage(enemy_damage)
    @health_points -= enemy_damage 
  end

  def up_level
    @level += 1 
  end
end
