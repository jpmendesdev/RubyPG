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
  else
      puts "2 - Go to Battle\n3 - Exit"
  end
end


def battle_menu
        battle = $game.create_battle
        $game.battles << battle
        $game.battles.first.display_battle_status
        $game.battles.first.battle_round
        $game.battles.clear
end
