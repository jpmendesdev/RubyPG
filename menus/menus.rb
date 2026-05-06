require_relative '../models/Player'
require_relative '../models/Enemy'
require_relative '../models/Game'

$game = Game.new

def game_menu
  loop do
      display_options()
      option = gets.chomp
      case option
      when '1' then $game.create_player
      when '2' then battle_menu()
      when '3' then break
      else puts "Invalid option!"
      end
  end
end

def display_options
  if $game.players.empty?
      puts "1 - Create Player\n3 - Exit"
  elsif $game.battles.empty?
      puts "2 - Phases\n3 - Exit"
  else
      puts "3 - Exit"
  end
end

def battle_menu
    display_battle_informations()
end

def display_battle_informations
    battle = $game.create_battle
    $game.battles << battle
    puts "\n1 - GO to  Battle\n2 - exit"
    return if gets.chomp == '2'
    $game.battles.first.display_battle_status
    $game.battles.first.battle_round
end
