# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

module TreasureKind
  
  ARMOR = :armor
  ONEHAND = :onehand
  BOTHHANDS = :bothhands
  HELMET = :helmet
  SHOES = :shoes
  
  def to_s() 
    
    tesoro = case self
    when ARMOR then "Armadura"
    when ONEHAND then "Arma de una mano"
    when BOTHHANDS then "Arma de dos manos"
    when HELMET then "Casco"
    when SHOES then "Botas"
    end
    
    return tesoro
  end
end

end
