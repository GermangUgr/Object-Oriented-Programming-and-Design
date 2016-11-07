# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

class SpecificBadConsequence < BadConsequence
  
  def initialize(texto,nivel, tVisible, tHidden)
    super(texto, nivel)
    
    @specificVisibleTreasures = tVisible
    @specificHiddenTreasures = tHidden
    
  end
  
  def getSpecificVisibleTreasures
    return @specificVisibleTreasures
  end
  
  def getSpecificHiddenTreasures
    return @specificHiddenTreasures
  end
  
  def to_s
    cadena = super
    
    cadena += " Especificos tesoros visibles perdidos = "
                for i in  @specificVisibleTreasures
                    cadena += i.to_s() + ", "
                end
    cadena += "Especificos tesoros ocultos perdidos = "
             for j in @specificHiddenTreasures 
                 cadena += j.to_s() + ", "
             end
    
    return cadena
  end
  
  def isEmpty
    vacio = false   
    vacio = true if (@specificVisibleTreasures.size == 0 and @specificHiddenTreasures.size == 0)
    
    return vacio
  end
  
  def substractVisibleTreasure(t)
    
    indice = @specificVisibleTreasures.index(t.getType)
    
    @specificVisibleTreasures.delete_at(indice)
  end
  
  def substractHiddenTreasure(t)
    indice = @specificHiddenTreasures.index(t.getType)
    @specificHiddenTreasures.delete_at(indice)
  end
  
  def adjustToFitTreasureList(v, h)
    copiav = Array.new
    copiah = Array.new
    vAjustado = Array.new
    hAjustado = Array.new

    v.each do |tesoro|
     copiav << (tesoro.getType())
    end    

    h.each do |tesoro|
     copiah << (tesoro.getType())
    end  

    @specificVisibleTreasures.each do |tipo|
     if(copiav.include?(tipo)) 
       vAjustado << (tipo)
       copiav.delete_at(copiav.index(tipo))
     end
    end

    @specificHiddenTreasures.each do |tipo|
     if(copiah.include?(tipo)) 
       hAjustado << (tipo)
       copiah.delete_at(copiah.index(tipo))
     end
    end

    malrollo = SpecificBadConsequence.new(@text,@levels,vAjustado,hAjustado)

    return malrollo
  end
  
end

end
