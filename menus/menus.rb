require './playerLib/Player'
require './enemyLIb/Enemy'

$players = []
$enemies = []
$battles = []

def game_menu
  loop do
      display_options()
      option = gets.chomp
      case option
      when '1' then player_menu()
      when '2' then battle_menu()
      when '3' then break
      else puts "Invalid option!"
      end
  end
end

def display_options
  if $players.empty?
      puts "1 - Create Player\n3 - Exit"
  elsif $battles.empty?
      puts "2 - Phases\n3 - Exit"
  else
      puts "3 - Exit"
  end
end

def player_menu
  puts "<<Write the player's name>>"
      player_name = gets.chomp
      default_player = Player.new(player_name,100,['silver sword'],1)
      $players << default_player
      puts default_player
end

def battle_menu
    display_battle_informations()
end

def generate_random_enemies
  [SlimeWorm,StoneWatchMan].sample.new
end

def display_battle_informations
  player = $players.first
  (1..3).each do |phase|
    puts "\n1 - GO to phase #{phase}\n2 - exit"
    return if gets.chomp == '2'
    player.health_points = 100
    enemy = generate_random_enemies()
    puts "\n<<Battle #{phase}>>\n#{player.name}: ❤️ #{player.health_points} X #{enemy.name}: ❤️ #{enemy.health_points}"
    $battles << 1
    battle_round(player,enemy)
  end
end

def generate_battle_rounds
  [true,false].sample
end

def player_attacks?
  generate_battle_rounds()
end

def perform_attack(attacker:,target:,message:)
  puts message
  target.get_damage(attacker.damage)
end

def execute_turn(player,enemy)
  if player_attacks?()
    perform_attack(attacker:player,target:enemy,message:"You're attacking") 
  else
    perform_attack(attacker:enemy,target:player,message:"Enemy attacking!")
  end
end

def battle_continues?(player,enemy)
  player.health_points > 0 && enemy.health_points > 0
end

def display_battle_status(player,enemy)
  puts "#{player.name}: ❤️ #{player.health_points} X #{enemy.name} ❤️ #{enemy.health_points}"
end

def finish_battle(player,enemy)
  puts "Round finished"
  if player.health_points > enemy.health_points
    player.up_level
    puts "You Win!\nLEVEL UP🌟: #{player.level}"
  else
    puts "Enemey Wins!"
  end
end

def battle_round(player,enemy)
  loop do
    display_battle_status(player,enemy)
    break finish_battle(player,enemy) unless battle_continues?(player,enemy)
    execute_turn(player,enemy)
  end
end
