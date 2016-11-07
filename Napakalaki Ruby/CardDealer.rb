# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'Monster.rb'
require_relative 'Treasure.rb'
require_relative 'NumericBadConsequence.rb'
require_relative 'DeathBadConsequence.rb'
require_relative 'SpecificBadConsequence.rb'
require_relative 'Cultist.rb'

module NapakalakiGame

class CardDealer
  
  attr_reader :unused_monsters, :used_monsters, :used_treasures, :unused_treasures, :unusedCultists
  
  @@instance = nil
  private_class_method :new
  
 private
 
  def initialize
    @unused_monsters = Array.new
    @used_monsters = Array.new
    @unused_treasures = Array.new
    @used_treasures = Array.new
    @unused_cultist = Array.new
  end
  
  def shuffleCultists
    
    @unused_cultist.shuffle!
  end
  
  def initCultistCardDeck
    @unused_cultist = Array.new
    
    @unused_cultist << Cultist.new('Sectario',1)
    @unused_cultist << Cultist.new('Sectario',2)
    @unused_cultist << Cultist.new('Sectario',1)
    @unused_cultist << Cultist.new('Sectario',2)
    @unused_cultist << Cultist.new('Sectario',1)
    @unused_cultist << Cultist.new('Sectario',1)
   
    shuffleCultists
    
  end
  
  def initTreasureCardDeck ()
    treasure_deck = Array.new
    
    treasure_deck << Treasure.new("Si mi amo",4,TreasureKind::HELMET)
    treasure_deck << Treasure.new("Botas de investigacion",3,TreasureKind::SHOES)
    treasure_deck << Treasure.new("Capucha de Cthulhu",3,TreasureKind::HELMET)
    treasure_deck << Treasure.new("A prueba de babas",2,TreasureKind::ARMOR)
    treasure_deck << Treasure.new("Botas de lluvia acida",1,TreasureKind::BOTHHANDS)
    treasure_deck << Treasure.new("Casco minero",2,TreasureKind::HELMET)
    treasure_deck << Treasure.new("Ametralladora Thompson",4,TreasureKind::BOTHHANDS)
    treasure_deck << Treasure.new("Camiseta de la UGR",1,TreasureKind::ARMOR)
    treasure_deck << Treasure.new("Clavo de rail ferroviario",3,TreasureKind::ONEHAND)
    treasure_deck << Treasure.new("Cuchillo de sushi arcano",2,TreasureKind::ONEHAND)
    treasure_deck << Treasure.new("Hacha prehistorica",2,TreasureKind::ONEHAND)
    treasure_deck << Treasure.new("El aparato del Pr.Tesla",4,TreasureKind::ARMOR)
    treasure_deck << Treasure.new("Gaita",4,TreasureKind::BOTHHANDS)
    treasure_deck << Treasure.new("Insecticida",2,TreasureKind::ONEHAND)
    treasure_deck << Treasure.new("Escopeta de tres caniones",4,TreasureKind::BOTHHANDS)
    treasure_deck << Treasure.new("Garabato mistico",2,TreasureKind::ONEHAND)
    treasure_deck << Treasure.new("La rebeca metalica",2,TreasureKind::ARMOR)
    treasure_deck << Treasure.new("Lanzallamas",4,TreasureKind::BOTHHANDS)
    treasure_deck << Treasure.new("Necrocomicon",1,TreasureKind::ONEHAND)
    treasure_deck << Treasure.new("Necronomicon",5,TreasureKind::BOTHHANDS)
    treasure_deck << Treasure.new("Linterna a 2 manos",3,TreasureKind::BOTHHANDS)
    treasure_deck << Treasure.new("Necrognomicon",2,TreasureKind::ONEHAND)
    treasure_deck << Treasure.new("Necrotelecom",2,TreasureKind::HELMET)
    treasure_deck << Treasure.new("Mazo de los atiguos",3,TreasureKind::ONEHAND)
    treasure_deck << Treasure.new("Necroplayboycon",3,TreasureKind::ONEHAND)
    treasure_deck << Treasure.new("Porra preternatural",2,TreasureKind::ONEHAND)
    treasure_deck << Treasure.new("Shogulador",1,TreasureKind::BOTHHANDS)
    treasure_deck << Treasure.new("Varita de atizamiento",3,TreasureKind::ONEHAND)
    treasure_deck << Treasure.new("Tentaculo de pega",2,TreasureKind::HELMET)
    treasure_deck << Treasure.new("Zapato deja-amigos",1,TreasureKind::SHOES)
    @unused_treasures = treasure_deck
    shuffleTreasures
  end
  
  def initMonsterCardDeck ()
    monsters = Array.new

    prize = Prize.new(2,1)
    badConsequence = 
      SpecificBadConsequence.new('Pierdes tu armadura visible y otra oculta',0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
    monsters << Monster.new('3 Byakhees de bonanza',8,badConsequence,prize,0)


    prize = Prize.new(4,2)
    badConsequence =
    NumericBadConsequence.new('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
    monsters << Monster.new('El rey de rosa',13,badConsequence,prize,0)


    prize = Prize.new(1,1)
    badConsequence = 
      SpecificBadConsequence.new('Embobados con el lindo primigenio te descartas de tu casco visible',0,[TreasureKind::HELMET],[])
    monsters << Monster.new('Chibithulhu',2,badConsequence,prize,0)


    prize = Prize.new(1,1)
    badConsequence = 
      SpecificBadConsequence.new('El primordial bostezo contagioso.Pierdes el calzado visible',0,[TreasureKind::SHOES],[])
    monsters << Monster.new('El sopor de Dunwich',2,badConsequence,prize,0)
  
 
    prize = Prize.new(4,1)
    badConsequence = 
      SpecificBadConsequence.new('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta',0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
    monsters<< Monster.new('Angeles de la noche ibicenca', 14, badConsequence,prize,0)


    prize = Prize.new(3,1)
    badConsequence = 
        NumericBadConsequence.new('Pierdes todos tus tesoros visibles',0,5,0)
    monsters<< Monster.new('El gorron en el umbral',10,badConsequence,prize,0)


    prize = Prize.new(2,1)
    badConsequence = 
        SpecificBadConsequence.new('Pierdes la armadura visible',0,[TreasureKind::ARMOR],[])
    monsters<< Monster.new('H.P.Munchcraft',6,badConsequence,prize,0)


    prize = Prize.new(1,1)
    badConsequence = 
        SpecificBadConsequence.new('Sientes bichos bajo la ropa.Descarta la armadura visible',0,[TreasureKind::ARMOR],[])
    monsters<< Monster.new('Bichgooth',2,badConsequence,prize,0)


    prize = Prize.new(1,1)
    badConsequence = 
      NumericBadConsequence.new('Toses los pulmones y pierdes 2 niveles',2,0,0)
    monsters << Monster.new('La que redacta en las tinieblas',2,badConsequence,prize,0)


    prize = Prize.new(2,1)
    badConsequence = 
      DeathBadConsequence.new('Estos monstruos resultan bastante superficiales y te aburren mortalmente. estas muerto',true)
    monsters << Monster.new('Los hondos',8,badConsequence,prize,0)


    prize = Prize.new(2,1)
    badConsequence = 
      NumericBadConsequence.new('Pierdes 2 niveles y 2 tesoros ocultos',2,0,2)
    monsters << Monster.new('Semillas Cthulhu',4,badConsequence,prize,0)


    prize = Prize.new(2,1)
    badConsequence = 
        SpecificBadConsequence.new('Te intentas escaquear. Pierdes una mano visible',0,[TreasureKind::ONEHAND],[])
    monsters<< Monster.new('Dameargo',1,badConsequence,prize,0)


    prize = Prize.new(1,1)
    badConsequence = 
      NumericBadConsequence.new('Da mucho asquito. Pierdes 3 niveles',3,0,0)
    monsters << Monster.new('Pollipolipo volante',3,badConsequence,prize,0)


    prize = Prize.new(3,1)
    badConsequence = 
      DeathBadConsequence.new('No le hace gracia que pronuncien mal su nombre. Estas muerto',true)
    monsters << Monster.new('Yskhtihyssg-Goth',12,badConsequence,prize,0)


    prize = Prize.new(4,1)
    badConsequence = 
      DeathBadConsequence.new('La familia te atrapa. Estas muerto',true)
    monsters << Monster.new('Familia feliz',1,badConsequence,prize,0)


    prize = Prize.new(2,1)
    badConsequence = 
        SpecificBadConsequence.new('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible',2,[TreasureKind::BOTHHANDS],[])
    monsters<< Monster.new('Roboggoth',8,badConsequence,prize,0)


    prize = Prize.new(1,1)
    badConsequence = 
        SpecificBadConsequence.new('Te asusta en la noche. Pierdes un casco visible',0,[TreasureKind::HELMET],[])
    monsters<< Monster.new('El espia',5,badConsequence,prize,0)


    prize = Prize.new(1,1)
    badConsequence = 
      NumericBadConsequence.new('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles',2,5,0)
    monsters << Monster.new('El Lenguas',20,badConsequence,prize,0)


    prize = Prize.new(1,1)
    badConsequence = 
      SpecificBadConsequence.new('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos',3,[TreasureKind::ONEHAND,TreasureKind::BOTHHANDS],[])
    monsters<< Monster.new('Bicefalo',20,badConsequence,prize,0)
    
    prize = Prize.new(3,1)
    badConsequence = 
      SpecificBadConsequence.new('Pierdes 1 mano visible',0,[TreasureKind::ONEHAND],[])
    monsters<< Monster.new('El mal indecible impronunciable',10,badConsequence,prize,-2)
    
    prize = Prize.new(2,1)
    badConsequence = 
      NumericBadConsequence.new('Pierdes tus tesoros visibles',0,5,0)
    monsters << Monster.new('Testigos oculares',6,badConsequence,prize,2)
    
    prize = Prize.new(2,5)
    badConsequence = 
      DeathBadConsequence.new('Hoy no es tu dia de suerte.Mueres',true)
    monsters << Monster.new('El gran cthulhu',20,badConsequence,prize,4)
    
    prize = Prize.new(2,1)
    badConsequence = 
      NumericBadConsequence.new('Tu gobierno te recorta 2 niveles',2,0,0)
    monsters << Monster.new('Serpiente politico',8,badConsequence,prize,-2)
    
    prize = Prize.new(1,1)
    badConsequence = 
      SpecificBadConsequence.new('Pierdes tu caso y tu armadura visible.Pierdes tus manos ocultas',0,[TreasureKind::HELMET,TreasureKind::ARMOR],[TreasureKind::BOTHHANDS])
    monsters<< Monster.new('Felpuggoth',2,badConsequence,prize,5)
    
    prize = Prize.new(4,2)
    badConsequence = 
      NumericBadConsequence.new('Pierdes 2 niveles',2,0,0)
    monsters << Monster.new('Shoggoth',16,badConsequence,prize,-4)
    
    prize = Prize.new(1,1)
    badConsequence = 
      NumericBadConsequence.new('Pintalabios negro.Pierdes 2 niveles',2,0,0)
    monsters << Monster.new('Lolitagooth',2,badConsequence,prize,3)
    
    @unused_monsters = monsters
    shuffleMonsters
  end
  
  def shuffleTreasures()
    @unused_treasures.shuffle!
  end
  
  def shuffleMonsters ()
    @unused_monsters.shuffle!
  end
  
  public
  
  def nextCultist
    if(@unused_cultist.empty?)
      aux = nil
    else
      aux = @unused_cultist.shift
    end 
    return aux
  end
  
  def self.instance ()
    @@instance = new if (@@instance == nil)
    return @@instance
  end
  
  def nextTreasure ()
    if ( @unused_treasures.empty?)
      @unused_treasures = @used_treasures
      @used_treasures = Array.new
      @unused_treasures.shuffle!
    end
      
      sig = @unused_treasures.shift
    
    return sig
  end
  
  def nextMonster ()
    if (@unused_monsters.empty?)
      @unused_monsters = @used_monsters
      @used_monsters = Array.new
      @unused_monsters.shuffle!
    end
      
      sig = @unused_monsters.shift
    
    return sig    
    
  end
  
  def giveTreasureBack (t) #Treasure t
    @used_treasures << t
  end
  
  def giveMonsterBack (m) #Monster m
    @used_monsters << m
  end
  
  def initCards ()
    initTreasureCardDeck
    initMonsterCardDeck
    initCultistCardDeck
  end
end

end