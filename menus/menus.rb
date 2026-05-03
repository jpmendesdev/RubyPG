require './playerLib/Player'
require './enemyLIb/Enemy'

def game_menu
  players = []
  enemies = []
  battles = []
  loop do
      display_options(players,battles)
      option = gets.chomp
      case option
      when '1' then player_menu(players)
      when '2' then battle_menu(battles,players)
      when '3' then break
      else puts "Invalid option!"
      end
  end
end

def display_options(players,battles)
  if players.empty?
      puts "1 - Create Player\n3 - Exit"
  elsif battles.empty?
      puts "2 - Phases\n3 - Exit"
  else
      puts "3 - Exit"
  end
end

def player_menu(players)
  puts "<<Write the player's name>>"
      player_name = gets.chomp
      if player_name.length >= 3
        default_player = Player.new(player_name,100,['silver sword'],1)
        players.push << default_player # push
        puts default_player
      else
        puts "Your name have to be at least 3 characters!"
      end
end

def battle_menu(battles,players)
  player = players.first
  (1..3).each do |phase|
    puts "\n1 - GO to phase #{phase}\n2 - exit"
    return if gets.chomp == '2'
    player.health_points = 100
    enemy = [SlimeWorm,StoneWatchMan].sample.new
    puts "\n<<Battle #{phase}>>\n#{player.name}: ❤️ #{player.health_points} X #{enemy.name}: ❤️ #{enemy.health_points}"
    battles << 1
    battle_round(player,enemy)
  end
end

def battle_round(player,enemy)
   loop do
      unless player.health_points > 0 && enemy.health_points > 0
        finish_battle(player,enemy)
        break
      end
    if [true,false].sample
      puts "You're attacking"
      enemy.get_damage(player.damage)
    else
      puts "Enemy attacking"
      player.get_damage(enemy.damage)
    end
    puts "#{player.name}: ❤️ #{player.health_points} X #{enemy.name} ❤️ #{enemy.health_points}"
  end
end

def finish_battle(player,enemy)
  puts "Round finished"
  if player.health_points > enemy.health_points
    player.level += 1
    puts "LEVEL UP🌟: #{player.level}"
  else
    puts "Enemey Wins!"
  end
end

