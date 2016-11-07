# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

class Dice
  
  private
  
  @@dice = nil
  
  def initialize()
    
  end
  
  public
  
  def self.instance()
    
    @@dice = new if (@@dice == nil)
    return @@dice
  end
  
  def nextNumber()
    return rand(6) + 1
  end
  
end

end
