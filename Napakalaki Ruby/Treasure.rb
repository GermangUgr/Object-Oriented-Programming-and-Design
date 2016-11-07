31# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

class Treasure
  
  private
  attr_reader :name, :bonus, :type
  
  public
  def initialize(n,bono,t) #String n, int bonus, TreasureKind t
    @name = n
    @bonus = bono
    @type = t
    
  end
  
  def to_s()
    cadena = "Nombre: #{@name}\n"+
             "Bonus: #{@bonus}\n"+
             "Tipo: #{@type}\n"
    return cadena
  end

    
  def getName 
    return @name
  end
  
  def getBonus
    return @bonus
  end
  
  def getType
    return @type
  end
  
  
end

end
