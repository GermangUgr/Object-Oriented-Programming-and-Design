# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'BadConsequence.rb'
require_relative 'NumericBadConsequence.rb'
require_relative 'DeathBadConsequence.rb'
require_relative 'SpecificBadConsequence.rb'
require_relative 'Monster.rb'
require_relative 'TreasureKind.rb'
require_relative 'Treasure.rb'
require_relative 'Dice.rb'
require_relative 'CombatResult.rb'

module NapakalakiGame

class Player
  
  attr_reader :name, :level, :dead, :can_i_steal, :hidden_treasures, :visible_treasures, :combat_level
  attr_accessor :pending_bad_consequence, :enemy
  
  @@MAXLEVEL = 10
  
  def initialize(nombre)
    
    @name = nombre
    @level = 0
    @dead = true
    @can_i_steal = true
    @hidden_treasures = Array.new
    @visible_treasures = Array.new
    @combat_level = 0
    @pending_bad_consequence = NumericBadConsequence.new(nil,0,0,0)
    @enemy = nil
    
  end
   
  private
  
  def bringToLife()
    @dead = false
  end
  
  def incrementLevels(i)
    @level = level + i
  end
  
  
  def decrementLevels(i)
    if ((@level - i) < 0)
      @level = 0
    else 
      @level = @level - i
    end
  end
  
  
  def setPendingBadConsequence(b) #BadConsequence b
    @pending_bad_consequence = b
  end
  
  
  def applyPrize(m) #Monster m
    n_levels = m.getLevelGained
    incrementLevels(n_levels)
    n_treasures = m.getTreasuresGained
    if (n_treasures > 0)
      dealer = CardDealer.instance
      i=0
      while i < n_treasures do
        treasure = dealer.nextTreasure
        @hidden_treasures << treasure
        i+=1
      end
    end
  end
  

  def applyBadConsequence(m) #Monster m
    bad_consequence = m.getBadConsequence
    n_levels = bad_consequence.getLevels
    decrementLevels(n_levels)
    pending_bad = bad_consequence.adjustToFitTreasureList(@visible_treasures,@hidden_treasures)
    setPendingBadConsequence(pending_bad)
  end
  
  
  def canMakeTreasureVisible(t) #Treasure t
      can_make = false
      #Comprobamos si tiene otra armadura,casco o botas si la tiene, no puede hacerse visible
      if (t.getType == TreasureKind::ARMOR or 
          t.getType == TreasureKind::HELMET or 
          t.getType == TreasureKind::SHOES)
          can_make = (howManyVisibleTreasures(t.getType) == 0)
      #Comprobamos si tiene otro arma a dos manos o un arma a una mano, si la tiene, no puede hacerse visible
      #si tiene aguno de los dos, no puede hacerse visible
      else if (t.getType == TreasureKind::BOTHHANDS)
          can_make = (howManyVisibleTreasures(TreasureKind::BOTHHANDS) == 0 and 
                      howManyVisibleTreasures(TreasureKind::ONEHAND)== 0)
      #Comprobamos si tiene un arma a dos manos o mas de un arma a una mano,
      #si es asi, no puede hacerse visible
      else
          can_make = (howManyVisibleTreasures(TreasureKind::BOTHHANDS) == 0 and 
                      howManyVisibleTreasures(TreasureKind::ONEHAND) < 2)
      end end

    return can_make
  end
  
  
  def howManyVisibleTreasures(t_kind)
    n_treasures = 0
    
    for i in @visible_treasures
      n_treasures += 1 if (i.getType == t_kind)
    end
    
    return n_treasures
  end
  
  def dieIfNoTreasures()
     
    if (@hidden_treasures.size == 0 and @visible_treasures.size == 0)
    @dead = true 
    @level = 1
    end
  end
  
  def haveStolen()
    @can_i_steal = true
  end
  
  protected
  
  def getOponentLevel(m)
    n = m.getCombatLevel
    return n
  end
  
  def shouldConvert()
    dado = Dice.instance
    n = dado.nextNumber
    if(n == 1)
      aux = true
    else
      aux = false
    end
    
    return aux
  end
  
  def getCombatLevel()
    nivel = @level  
    
    @visible_treasures.each do |tesoro|
      nivel += tesoro.getBonus
    end
    
    return nivel; 
  end
  
  public
  
  def copiarJugador(p_aux)
    @name = p_aux.getName
    @level = p_aux.getLevels
    @dead = p_aux.isDead
    @can_i_steal = p_aux.canISteal
    @hidden_treasures =p_aux.getHiddenTreasures
    @visible_treasures = p_aux.getVisibleTreasures
    @combat_level = p_aux.getCombatLevel
    @pending_bad_consequence = p_aux.pending_bad_consequence
    @enemy = p_aux.enemy
  end
  
  def to_s()
    return @name
  end
  
  def getName() 
    return @name
  end
   

  def getLevels()
    return @level
  end
  
  def isDead()
    return @dead
  end
  
  
  def combat(monstruo)
    my_level = getCombatLevel
    monster_level = getOponentLevel(monstruo)

    if (my_level > monster_level)
      applyPrize(monstruo)
      combat_result = CombatResult::WIN
    else
      applyBadConsequence(monstruo)
      combat_result = CombatResult::LOSE
      if(shouldConvert)
        combat_result = CombatResult::LOSEANDCONVERT
      end
    end
    
    if(@level > 9)
      combat_result = CombatResult::WINGAME
    end
    
    return combat_result
  end
  
  
  def makeTreasureVisible(tesoro)
    can_i = canMakeTreasureVisible(tesoro)
    if (can_i)
      @visible_treasures << tesoro
      @hidden_treasures.delete(tesoro)
    end
  end
  
  
  def discardVisibleTreasure(tesoro)
    @visible_treasures.delete(tesoro)
    if(@pending_bad_consequence!=nil and (!@pending_bad_consequence.isEmpty))
      @pending_bad_consequence.substractVisibleTreasure(tesoro)
    end
    dieIfNoTreasures
  end
  
  
  def discardHiddenTreasure(tesoro)
    @hidden_treasures.delete(tesoro)
    if(@pending_bad_consequence!=nil and (!@pending_bad_consequence.isEmpty))
      @pending_bad_consequence.substractHiddenTreasure(tesoro)
    end
    dieIfNoTreasures
  end
  
  
  def validState()
    
    state = (@hidden_treasures.size < 5 and @pending_bad_consequence.isEmpty)
    return state
  end
  
  
  def initTreasures()
    dealer = CardDealer.instance
    dice = Dice.instance
    bringToLife
    treasure = dealer.nextTreasure
    @hidden_treasures << treasure
    number = dice.nextNumber
    if (number > 1)
      treasure = dealer.nextTreasure
      @hidden_treasures << treasure
    end
    if (number == 6)
      treasure = dealer.nextTreasure
      @hidden_treasures << treasure
    end
  end
  
 
  def stealTreasure()
    treasure = nil
    can_i = canISteal
    if (can_i)
      can_you = @enemy.canYouGiveMeATreasure
      if (can_you)
        treasure = @enemy.giveMeATreasure
        @hidden_treasures << treasure
        haveStolen
      end
    end
    return treasure
  end
  
  
  def setEnemy(enemy) #Player enemy
    @enemy = enemy
  end
  
  def canISteal()
    return @can_i_steal
  end
  
  def discardAllTreasures()
    
    tope = @visible_treasures.size   
    i=0
    while(i<tope)do
      discardVisibleTreasure(@visible_treasures.at(0))
      i=i+1
    end
    
    tope = @hidden_treasures.size    
    i=0
    while(i<tope)do
      discardHiddenTreasure(@hidden_treasures.at(0))
      i=i+1
    end
    
  end

  def getVisibleTreasures()
    return @visible_treasures
  end
  
  def getHiddenTreasures()
    return @hidden_treasures
  end
  
  def getEnemy()
    return @enemy
  end
  
  def canYouGiveMeATreasure()
    can_give = false
    can_give = true unless (@hidden_treasures.length < 1)
    return can_give                        
  end
  
  def giveMeATreasure()
    tesoro = @hidden_treasures[rand(@hidden_treasures.size)]
    @hidden_treasures.delete_at(@hidden_treasures.index(tesoro))
    return tesoro
  end
end

end
