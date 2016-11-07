# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

class NumericBadConsequence < BadConsequence
  
  def initialize(texto, nivel, nVisible, nHidden)
    super(texto,nivel)
    
    @n_visible_treasures = nVisible
    @n_hidden_treasures = nHidden
  end
  
  def getNVisible
    return @n_visible_treasures
  end
  
  def getNHidden
    return @n_hidden_treasures
  end
 
  
  def to_s
    cadena = super
    cadena += "Niveles perdidos =  #{@levels}," + 
                      "Tesoros visibles perdidos = #{@n_visible_treasures}," + 
                      "Tesoros ocultos perdidos = #{@n_hidden_treasures} "
    return cadena                
  end
  
  def isEmpty
    vacio = false
    
    if(@n_visible_treasures ==0 and @n_hidden_treasures ==0)# or (@n_visible_treasures <-1 or @n_hidden_treasures <-1))
      vacio = true
    end
    
    return vacio
  end
  
  def substractVisibleTreasure(t)
    @n_visible_treasures = @n_visible_treasures -1
  end
  
  def substractHiddenTreasure(t)
    @n_hidden_treasures = @n_hidden_treasures -1
  end
  
  def adjustToFitTreasureList(v, h)
    
    tamav = @n_visible_treasures
    tamah = @n_hidden_treasures
    if(v.size()<@n_visible_treasures)
      tamav = v.size
    end
    if(h.size()<@n_hidden_treasures)
      tamah = h.size
    end
    malrollo = NumericBadConsequence.new(@text, @levels, tamav, tamah)
        
    return malrollo
  end
  
end

end
