# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'BadConsequence.rb'
require_relative 'NumericBadConsequence.rb'
require_relative 'DeathBadConsequence.rb'
require_relative 'SpecificBadConsequence.rb'
require_relative 'Prize.rb'

module NapakalakiGame

class Monster
 
  attr_reader :name, :combat_level, :bad_consequence, :prize, :levelChangeAgainstCultistPlayer;

  def initialize(nombre, nivel, mal_rollo, premio,nivel_aux_sectarios)
    
    @name = nombre
    @combat_level = nivel
    @bad_consequence = mal_rollo
    @prize = premio
    @levelChangeAgainstCultistPlayer = nivel_aux_sectarios
    
  end
  
  def to_s ()
    
    return "Nombre del bicho: #{@name}\nNivele del bicho #{@combat_level}\n" + @bad_consequence.to_s +
            "\n" + @prize.to_s + "\n"
    
  end
  
  def getLevelGained
    return @prize.getLevels
  end
  
  def getTreasuresGained
    return @prize.getTreasures
  end
  
  def getCombatLevel
    return  @combat_level
  end
  
  def getCombatLevelAgainstCultistPlayer
    aux = @combat_level + @levelChangeAgainstCultistPlayer
    return aux
  end
  
  def getBadConsequence
    return @bad_consequence
  end
  
  def getName
    return @name
  end
  
end

end
