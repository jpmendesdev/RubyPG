require_relative 'Player.rb'
require_relative 'Battle.rb'

class Game
  attr_accessor :players
  attr_accessor :battles
  def initialize
    @players = []
    @battles = []
  end

  def create_player
    puts "<<Write the player's name>>"
    player_name = gets.chomp
    default_player = Player.new(player_name)
    @players << default_player
    puts default_player
  end

  def create_battle
    battle = Battle.new
    @battles << battle
  end

  def to_s
    "#{@players}, #{@battles}"
  end
end
