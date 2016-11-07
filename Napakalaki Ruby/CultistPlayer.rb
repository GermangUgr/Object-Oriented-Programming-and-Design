# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  

require_relative 'Monster.rb'
require_relative 'Player.rb'

class CultistPlayer < Player
  
  @@totalCultistPlayers =0
  
  def initialize(p_aux,c)
    
    copiarJugador(p_aux)
    @myCultistCard = c
    @@totalCultistPlayers = @@totalCultistPlayers +1
    puts 'Te has convertido en cultist'
  end
  
  protected
  
  def getOponentLevel(m)
    n = m.getCombatLevelAgainstCultistPlayer
    return n
  end
  
  def shouldConvert()
    aux = false
    return aux
  end
  
  def getCombatLevel()
    aux = super
    n = aux + aux*0.2 + (@myCultistCard.getGainedLevels)*@@totalCultistPlayers
    n= n/1
    
    return n
  end
  
  public
  
  def giveMeATreasure()
    tesoro = @visible_treasures[rand(@visible_treasures.size)]
    @visible_treasures.delete_at(@visible_treasures.index(tesoro))
    return tesoro
  end
  
  def canYouGiveMeATreasure()
    can_give = false
    can_give = true unless (@visible_treasures.length < 1)
    return can_give                        
  end
  
  
  def self.getTotalCultistPlayers
    return @@totalCultistPlayers
  end
    
end

end
