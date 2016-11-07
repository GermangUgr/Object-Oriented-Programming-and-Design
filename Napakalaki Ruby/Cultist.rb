# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Cultist
  def initialize(n,glevels)
    @name = n
    @gainedLevels = glevels
  end
  
  def getGainedLevels
    return @gainedLevels
  end
end
