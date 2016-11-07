# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

class DeathBadConsequence < NumericBadConsequence
  
  def initialize(texto, muerte)
    super(texto,0,0,0)
    @death = muerte
  end
  
  def getDeath
    
    return @death
  end
  
  def to_s
    cadena = "Este mal rollo te mata"
    return cadena
  end
  
  def adjustToFitTreasureList(v, h)
      malrollo = NumericBadConsequence.new(@text,0,v.size,h.size)
      return malrollo
  end
  
end

end
