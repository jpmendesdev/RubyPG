require_relative 'Enemy.rb'
require_relative 'Game.rb'

class Battle
  attr_accessor :enemy
  def initialize
    @player = $game.players.first
    @enemy = generate_random_enemies()
  end

  def generate_random_enemies
    [SlimeWorm,StoneWatchMan].sample.new
  end

  def player_attacks?
    [true,false].sample
  end

  def perform_attack(attacker:,target:,message:)
    puts message
    target.get_damage(attacker.damage)
  end

  def execute_turn
    if player_attacks?()
      perform_attack(attacker:@player,target:@enemy,message:"You're attacking") 
    else
      perform_attack(attacker:@enemy,target:@player,message:"Enemy attacking!")
    end
  end

  def battle_continues?
    @player.health_points > 0 && @enemy.health_points > 0
  end

  def display_battle_status
    puts "#{@player.name}: ❤️ #{@player.health_points} X #{@enemy.name} ❤️ #{@enemy.health_points}"
  end

  def finish_battle
    puts "Round finished"
    if @player.health_points > @enemy.health_points
      @player.up_level
      puts "You Win!\nLEVEL UP🌟: #{@player.level}"
    else
      puts "Enemey Wins!"
    end
  end

  def battle_round
    loop do
      display_battle_status()
      break finish_battle unless battle_continues?()
      execute_turn()
    end
  end
end