# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'TreasureKind.rb'

module NapakalakiGame

class BadConsequence
  
  attr_reader :text, :MAXTREASURES
  
  @@MAXTREASURES = 10
  
  def initialize (texto, nivel)   
    @text = texto
    @levels = nivel
  end
  
  def to_s
    
    cadena = "El efecto del mal rollo de este monstruo es: \n"
    return cadena;     
  end
  
  def setTexto(texto)
    @text = texto
  end
  
  def getLevels
    return @levels
  end

  def isEmpty
    #raise NotImplementedError.new
  end
  
  def adjustToFitTreasureList (v, h) #Treasure[] v, Treasure[] h   
    #raise NotImplementedError.new
  end
  
  def substractVisibleTreasure(t)
    #raise NotImplementedError.new
  end
  
  def substractHiddenTreasure(t)
    #raise NotImplementedError.new
  end
  
end

end