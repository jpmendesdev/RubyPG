require './playerLib/Player'
require './enemyLIb/Enemy'

def game_menu
  players = []
  enemies = []
  battles = []
  while true
    if players.length == 0
      puts "
      1 - Create Player
      3 - Exit
        "
    elsif battles.length == 0
      puts "
      2 - Phases
      3 - Exit
        "
    else
      puts "3 - Exit"
    end
    option = gets.chomp
    case
    when option == '1'
       player_menu(players)
    when option == '2'
       battle_menu(battles,players)
    else
      break
    end
  end
end

def player_menu(players)
  puts "<<Write the player's name>>"
      player_name = gets.chomp
      if player_name.length >= 3
        default_player = Player.new(player_name,100,['silver sword'],1)
        players.push(default_player)
        puts default_player
      else
        puts "Your name have to be at least 3 characters!"
      end
end

def battle_menu(battles,players)
  for phase in 1..3
    puts "
      1 - GO to phase #{phase}
      2 - exit
    "
    option = gets.chomp
    case
    when option == '1'
      players[0].health_points = 100
      random_enemy_number = rand(1..2)
      enemy = Enemy.allocate
      if random_enemy_number == 1
        enemy = SlimeWorm.new
      elsif random_enemy_number == 2
        enemy = StoneWatchMan.new
      end
      puts "
      <<Battle #{phase}>>
      #{players[0].name}: ❤️ #{players[0].health_points} X #{enemy.name}: ❤️ #{enemy.health_points}
      "
      battles.push(1)
      battle_round(players[0],enemy)
    when option == '3'
      break
    end
  end
end

def battle_round(player,enemy)
  while true
    enemy_damage = enemy.damage
    player_damage = player.damage
    round = rand(1..2)
    if player.health_points > 1 and enemy.health_points > 1
      if round == 1
        puts "You're attacking"
        enemy.get_damage(player_damage)
        puts "#{player.name}: ❤️ #{player.health_points} X #{enemy.name} ❤️ #{enemy.health_points}"
      elsif round == 2
        puts "Enemy attacking"
        player.get_damage(enemy_damage)  
        puts "#{player.name}: ❤️ #{player.health_points} X #{enemy.name} ❤️ #{enemy.health_points}"  
      end
    else
      puts "Round finished"
      result = enemy.health_points > player.health_points ? "Enemy Wins" : "You win"
      puts result
      if result == 'You win'
        player.level += 1
        puts"LEVEL UP! 🌟 #{player.level}"
      end
      break
    end
  end
end

