# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'Player.rb'
require_relative 'CultistPlayer.rb'
require_relative 'Cultist.rb'
require_relative 'CardDealer.rb'
require_relative 'NumericBadConsequence.rb'
require_relative 'DeathBadConsequence.rb'
require_relative 'SpecificBadConsequence.rb'

module NapakalakiGame

class Napakalaki
  
  attr_reader :current_player, :players, :current_monster
  
  @@instance = nil
  private_class_method :new
  
private

  def initialize ()
    @players = Array.new
    #@players << Player.new("jugador0")
    @current_player = nil
    @dealer = CardDealer.instance()
    @current_monster = nil
  end
  
  def initPlayers(nombres)
    i=0;
    
    while(i<nombres.length)
      aux = Player.new(nombres.at(i))
      i+=1
      @players << aux
    end
  end
  
  
  def nextPlayer()
    
    if(@current_player == nil)
      indice = rand(@players.length)
      jugador_aux = @players.at(indice) 
      @current_player = jugador_aux
    else
      indice = (@players.index(@current_player) +1)%@players.length
      jugador_aux = @players.at(indice)
      @current_player = jugador_aux  
    end
    
    return @current_player
  end
  
  def nextTurnAllowed()
    permitido = true
    if(@current_player != nil)
    permitido = @current_player.validState
    end
    return permitido
  end
  
  def setEnemies()
    i=0
    if(@players.length == 1)
      p = @player.get(0)
      p.setEnemy(p)
    else
      while(i<@players.length)
        indice = i 
        while(indice == i)
          indice = rand(@players.length)
        end
        (@players.at(i)).setEnemy(@players.at(indice))
        i+=1
      end
    
    end
  end
  
public

  def self.instance()
    @@instance = new if (@@instance == nil)
    return @@instance
  end
  
  def developCombat()
    combat_result = @current_player.combat(@current_monster)
    @dealer.giveMonsterBack(@current_monster)
    if(combat_result == CombatResult::LOSEANDCONVERT)
      carta_aux = @dealer.nextCultist
      jugador_aux = CultistPlayer.new(@current_player,carta_aux)
      i = @players.find_index(@current_player)
      @players[i] = jugador_aux
      
      @players.each do |x|
        if(x.getEnemy == @current_player)
          x.setEnemy(jugador_aux)
        end
      end
      @current_player = jugador_aux
      
    end
    return combat_result
  end
  
  def discardVisibleTreasures (treasures)
    for i in treasures 
      @current_player.discardVisibleTreasure(i)
      @dealer.giveTreasureBack(i)
    end
  end
  
  def discardHiddenTreasures (treasures)
    for i in treasures 
      @current_player.discardHiddenTreasure(i)
      @dealer.giveTreasureBack(i)
    end
  end
  
  def makeTreasuresVisible(tesoros)
    for i in tesoros
      @current_player.makeTreasureVisible(i)
    end
  end
  
  def initGame (names)
    initPlayers(names)
    setEnemies
    @dealer.initCards
    nextTurn
    
  end
  
  def nextTurn ()
    
    state_ok = nextTurnAllowed
    if (state_ok)
      @current_monster = @dealer.nextMonster
      @current_player = nextPlayer
      dead = @current_player.isDead
      @current_player.initTreasures if(dead)
    end
    return state_ok
  end
  
  def endOfGame (resultado)
    fin = false
    
    if(resultado == CombatResult::WINGAME)
      fin = true
    end  
     
    return fin
  end
  
  def getCurrentPlayer()
    
    return @current_player
  end
  
  def getCurrentMonster()
    
    return @current_monster
  end
end


end


