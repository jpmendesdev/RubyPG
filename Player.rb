players = []
enemies = []
battles = []

while true
  if players.length == 0
  puts "
      1 - Create Player
      2 - Phases
      3 - Exit"
  else
    puts "
      2 - Phases
      3 - Exit"
  end
  option = gets.chomp
   if option == '1'
    puts "<<Write the player's name>>"
    player_name = gets.chomp
    default_player = Player.new(player_name,100,['silver sword'],1)
    players.push(default_player)
    puts default_player
   end
   if option == '2'
    if battles.length == 0
      puts "<<Battle 1>>"
      random_enemy_number = rand(1..2)
      print(random_enemy_number)
      enemy = Enemy.allocate
      if random_enemy_number == 1
        enemy = SlimeWorm.new
      elsif random_enemy_number == 2
        enemy = StoneWatchMan.new
      end
      puts players[0]
      puts "X"
      puts enemy
    end
   end
  if option == '3'
    break
  end
end