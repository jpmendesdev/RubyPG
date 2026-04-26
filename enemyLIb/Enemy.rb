class Enemy
  attr_reader :name
  attr_reader :damage 
  attr_reader :health_points 
  def initialize(name,health_points,difficult,damage)
    @name = "Enemy"
    @health_points = 30
    @difficult = "easy"
    @damage = 1
  end

  def power()
      puts "sending damage!!!"
  end

  def get_damage(player_damage)
    @health_points -= player_damage
  end

  def to_s
    "
    Muahahah!!!! #{@name} 
    #{@health_points} 
    #{@difficult}
    #{@damage}
    "
  end
end

class SlimeWorm < Enemy
  def initialize
    super(@name,@health_points,@difficult,@damage)
    @name = "SlimeWorm"
    @health_points = 40
    @difficult = "easy"
    @damage = 4
  end
  def special_power()
    puts "sending slime damage!!!"
  end
end

class StoneWatchMan < Enemy
  def initialize
    super(@name,@health_points,@difficult,@damage)
    @name = "StoneWatchMan"
    @health_points = 45
    @difficult = "easy"
    @damage = 5
  end

  def special_power()
    puts "sending rock!!!"
  end
end