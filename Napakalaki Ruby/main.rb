# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'TreasureKind.rb'
require_relative 'BadConsequence.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'CardDealer.rb'
require_relative 'Dice.rb'
require_relative 'Napakalaki.rb'
require_relative 'Treasure.rb'
require_relative 'CombatResult.rb'



monsters = Array.new

prize = Prize.new(2,1)
badConsequence = 
  BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible y otra oculta',0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
monsters << Monster.new('3 Byakhees de bonanza',8,badConsequence,prize)


prize = Prize.new(4,2)
badConsequence =
BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
monsters << Monster.new('El rey de rosa',13,badConsequence,prize)


prize = Prize.new(1,1)
badConsequence = 
  BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible',0,[TreasureKind::HELMET],nil)
monsters << Monster.new('Chibithulhu',2,badConsequence,prize)


prize = Prize.new(1,1)
badConsequence = 
  BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso.Pierdes el calzado visible',0,[TreasureKind::SHOES],nil)
monsters << Monster.new('El sopor de Dunwich',2,badConsequence,prize)
  
 
prize = Prize.new(4,1)
badConsequence = 
  BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta',0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
monsters<< Monster.new('Angeles de la noche ibicenca', 14, badConsequence,prize)


prize = Prize.new(3,1)
badConsequence = 
    BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles',0,5,0)
monsters<< Monster.new('El gorron en el umbral',10,badConsequence,prize)


prize = Prize.new(2,1)
badConsequence = 
    BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible',0,[TreasureKind::ARMOR],nil)
monsters<< Monster.new('H.P.Munchcraft',6,badConsequence,prize)


prize = Prize.new(1,1)
badConsequence = 
    BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa.Descarta la armadura visible',0,[TreasureKind::ARMOR],nil)
monsters<< Monster.new('Bichgooth',2,badConsequence,prize)


prize = Prize.new(1,1)
badConsequence = 
  BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles',2,0,0)
monsters << Monster.new('La que redacta en las tinieblas',2,badConsequence,prize)


prize = Prize.new(2,1)
badConsequence = 
  BadConsequence.newDeath('Estos monstruos resultan bastante superficiales y te aburren mortalmente. estas muerto',true)
monsters << Monster.new('Los hondos',8,badConsequence,prize)


prize = Prize.new(2,1)
badConsequence = 
  BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos',2,0,2)
monsters << Monster.new('Semillas Cthulhu',4,badConsequence,prize)


prize = Prize.new(2,1)
badConsequence = 
    BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes una mano visible',0,[TreasureKind::ONEHAND],nil)
monsters<< Monster.new('Dameargo',1,badConsequence,prize)


prize = Prize.new(1,1)
badConsequence = 
  BadConsequence.newLevelNumberOfTreasures('Da mucho asquito. Pierdes 3 niveles',3,0,0)
monsters << Monster.new('Pollipolipo volante',3,badConsequence,prize)


prize = Prize.new(3,1)
badConsequence = 
  BadConsequence.newDeath('No le hace gracia que pronuncien mal su nombre. Estas muerto',true)
monsters << Monster.new('Yskhtihyssg-Goth',12,badConsequence,prize)


prize = Prize.new(4,1)
badConsequence = 
  BadConsequence.newDeath('La familia te atrapa. Estas muerto',true)
monsters << Monster.new('Familia feliz',1,badConsequence,prize)


prize = Prize.new(2,1)
badConsequence = 
    BadConsequence.newLevelSpecificTreasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible',2,[TreasureKind::BOTHHANDS],nil)
monsters<< Monster.new('Roboggoth',8,badConsequence,prize)


prize = Prize.new(1,1)
badConsequence = 
    BadConsequence.newLevelSpecificTreasures('Te asusta en la noche. Pierdes un casco visible',0,[TreasureKind::HELMET],nil)
monsters<< Monster.new('El espia',5,badConsequence,prize)


prize = Prize.new(1,1)
badConsequence = 
  BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles',2,5,0)
monsters << Monster.new('El Lenguas',20,badConsequence,prize)


prize = Prize.new(1,1)
badConsequence = 
  BadConsequence.newLevelSpecificTreasures('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos',3,[TreasureKind::ONEHAND,TreasureKind::BOTHHANDS],nil)
monsters<< Monster.new('Bicefalo',20,badConsequence,prize)

puts "Los siguientes monstruos tienen nivel mayor que 10\n"

for i in monsters 
  puts i.to_s + "\n" if (i.combat_level > 10)
end

puts "//////////////////////////////////////////////////////////////\n"
puts "Los siguientes monstruos otorgan mas de un nivel al matarlos\n"

for k in monsters
  premio = k.prize
  puts k.to_s + "\n" if (premio.level > 1)
end

puts "////////////////////////////////////////////////////////////////////////////\n"
puts "Los siguientes monstruos tiene un mal rollo que implica perdida de tesoros\n"

for n in monsters
  mal_rollo2 = n.bad_consequence
  puts n.to_s + "\n" if (mal_rollo2.specific_visible_treasures != nil or 
                  mal_rollo2.specific_hidden_treasures != nil)
end

puts "/////////////////////////////////////////////////////////////////////////////////\n"
puts "Los siguientes mostruos tienen un mal rollo que implica solo perdida de niveles\n"

for j in monsters
  mal_rollo = j.bad_consequence
  puts j.to_s + "\n" if (mal_rollo.levels > 0 and mal_rollo.n_visible < 1 and
                  mal_rollo.n_hidden < 1 and mal_rollo.specific_visible_treasures == nil and
                  mal_rollo.specific_hidden_treasures == nil and mal_rollo.death == false)
end
