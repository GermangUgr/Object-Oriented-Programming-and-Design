# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

class Prize
  
  attr_reader :treasures, :level;
  
  def initialize(tesoros, niveles)
    
    @treasures = tesoros
    @level = niveles
    
  end
  
  def to_s ()
    
    return "El premio por matar este monstruo es: \nTesoros ganados: #{@treasures}\nNiveles Ganados: #{@level}"
    
  end
  
  def getTreasures
    return @treasures
  end
  
  def getLevels
    return @level
  end
end

end
