/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NapakalakiGame;

import static NapakalakiGame.TreasureKind.ARMOR;
import static NapakalakiGame.TreasureKind.BOTHHANDS;
import static NapakalakiGame.TreasureKind.HELMET;
import static NapakalakiGame.TreasureKind.ONEHAND;
import static NapakalakiGame.TreasureKind.SHOES;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
/**
 *
 * @author Antonio
 */
public class CardDealer {
    
    ////////////////////////////////////////
    /////////////////////////////////////////
    
    private static CardDealer dealer = null;
    private ArrayList<Monster> usedMonsters = null;
    private ArrayList<Monster> unusedMonsters = null;
    private ArrayList<Treasure> usedTreasures = null;
    private ArrayList<Treasure> unusedTreasures = null;
    private ArrayList<Cultist> unusedCultists = null;
    
    
    private CardDealer(){
        //Para crear un objeto en el main:
        //CardDealer dealer = CardDealer.getInstance();
        usedMonsters = new ArrayList();
        unusedMonsters = new ArrayList();
        usedTreasures = new ArrayList();
        unusedTreasures = new ArrayList();
        unusedCultists = new ArrayList();
        
    }
    
    private void initTreasureCardDeck(){
        
        unusedTreasures.add(new Treasure("¡Si mi amo!", 4, HELMET));
        unusedTreasures.add(new Treasure("Botas de investigacion", 3, SHOES));
        unusedTreasures.add(new Treasure("Capucha de Cthulhu", 3, HELMET));
        unusedTreasures.add(new Treasure("A prueba de babas", 2, ARMOR));
        unusedTreasures.add(new Treasure("Botas de lluvia acida", 1, BOTHHANDS));
        unusedTreasures.add(new Treasure("Casco minero", 2, HELMET));
        unusedTreasures.add(new Treasure("Ametralladora Thompson", 4, BOTHHANDS));
        unusedTreasures.add(new Treasure("Camiseta de la UGR", 1, ARMOR));
        unusedTreasures.add(new Treasure("Clavo de rail ferroviario", 3, ONEHAND));
        unusedTreasures.add(new Treasure("Cuchillo de sushi arcano", 2, ONEHAND));
        unusedTreasures.add(new Treasure("Fez alopodo", 3, HELMET));
        unusedTreasures.add(new Treasure("Hacha prehistorica", 2, ONEHAND));
        unusedTreasures.add(new Treasure("El aparato del PR.Tesla", 4, ARMOR));
        unusedTreasures.add(new Treasure("Gaita", 4, BOTHHANDS));
        unusedTreasures.add(new Treasure("Insecticida", 2, ONEHAND));
        unusedTreasures.add(new Treasure("Escopeta de 3 canones", 4, BOTHHANDS));
        unusedTreasures.add(new Treasure("Garabato mistico", 2, ONEHAND));
        unusedTreasures.add(new Treasure("La rebeca metalica", 2, ARMOR));
        unusedTreasures.add(new Treasure("Lanzallamas", 4, BOTHHANDS));
        unusedTreasures.add(new Treasure("Necro-comicon", 1, ONEHAND));
        unusedTreasures.add(new Treasure("Necronomicon", 5, BOTHHANDS));
        unusedTreasures.add(new Treasure("Linterna a 2 manos", 3, BOTHHANDS));
        unusedTreasures.add(new Treasure("Necro-gnomicon", 2, ONEHAND));
        unusedTreasures.add(new Treasure("Necrotelecom", 2, HELMET));
        unusedTreasures.add(new Treasure("Mazo de los antiguos", 3, ONEHAND));
        unusedTreasures.add(new Treasure("Necro-playboycon", 3, ONEHAND));
        unusedTreasures.add(new Treasure("Porra preternatural", 2, ONEHAND));
        unusedTreasures.add(new Treasure("Shogulador", 1, BOTHHANDS));
        unusedTreasures.add(new Treasure("Varita de atizamiento", 3, ONEHAND));
        unusedTreasures.add(new Treasure("Tentaculo de pega", 2, HELMET));
        unusedTreasures.add(new Treasure("Zapato deja-amigos", 1, SHOES));
        
         shuffleTreasures();
        
    }
    
    private void initMonsterCardDeck(){
        
        BadConsequence mal_rollo;
        
        //3 Byakhees de bonanza 
        mal_rollo = new SpecificBadConsequence("Pierdes tu armadura visible y otra oculta", 0, 
                    new ArrayList(Arrays.asList(TreasureKind.ARMOR)),
                    new ArrayList(Arrays.asList(TreasureKind.ARMOR)));
        
        unusedMonsters.add(new Monster("3 Byakhees de bonanza", 8, mal_rollo, new Prize(2,1)));
        
        //Chibithulhu 
        mal_rollo = new SpecificBadConsequence("Embolados con el lindo primigenio te descartas de tu casco visible",
                        0,new ArrayList(Arrays.asList(TreasureKind.HELMET)),new ArrayList());
        unusedMonsters.add(new Monster("Chibithulhu", 2, mal_rollo, new Prize(1,1)));
        
        //El sopor de Dunwich 
        mal_rollo = new SpecificBadConsequence("El primordial bostezo contagioso. Pierdes el calzado visible", 0,
                    new ArrayList (Arrays.asList(TreasureKind.SHOES)),
                    new ArrayList());
        unusedMonsters.add(new Monster("El sopor de Dunwich", 2, mal_rollo, new Prize(1,1)));
        
        //Angeles de la noche ibicenca
        mal_rollo = new SpecificBadConsequence("Te atrapan para llevarte de fiesta y te dejan caer en mitad de vuelo. Descarta una mano visible y una mano coulta",
                                        0,new ArrayList(Arrays.asList(TreasureKind.ONEHAND)),new ArrayList(Arrays.asList(TreasureKind.ONEHAND)));
        
        unusedMonsters.add(new Monster("Angeles de la noche ibicenca",14, mal_rollo, new Prize(4,1)));
        
        //El gorron en el humbral
        mal_rollo = new NumericBadConsequence("Pierdes todos tus tesoros visibles",0,5,0);
        
        unusedMonsters.add(new Monster("El gorron en el humbral", 10, mal_rollo, new Prize(3,1)));
        
        //H.P. Munchcraft
        mal_rollo = new SpecificBadConsequence("Pierdes la armadura visible",0,
                    new ArrayList (Arrays.asList(TreasureKind.ARMOR)),new ArrayList());
        
        unusedMonsters.add(new Monster("H.P. Munchcraft", 6, mal_rollo, new Prize(2,1)));
        
        //Bichgooth
        mal_rollo = new SpecificBadConsequence("Sientes bichos bajo la ropa, descarta la armadura visible", 0,
                    new ArrayList (Arrays.asList(TreasureKind.ARMOR)),new ArrayList());
        
        unusedMonsters.add(new Monster("Bichgooth", 2, mal_rollo, new Prize(1,1)));
        
        //El rey de la rosa
        mal_rollo = new NumericBadConsequence("Pierdes 5 nieveles y tres tesoros visibles",5,3,0);
        
        unusedMonsters.add(new Monster("El rey de la rosa", 13, mal_rollo, new Prize(4,2)));
        
        //La que redacta en las tinieblas
        mal_rollo = new NumericBadConsequence("Toses los pulmones y pierdes dos niveles",2,0,0);
        
        unusedMonsters.add(new Monster("La que redacta en las tinieblas", 2, mal_rollo, new Prize(1,1)));
        
        //Los Hondos
        mal_rollo = new DeathBadConsequence("Estos mosntruos son bastante superficiales y te aburren mortalmente. Estas muerto",0);
        
        unusedMonsters.add(new Monster ("Los hondos", 8, mal_rollo, new Prize(2,1)));
        
        //Semillas Cthulhu
        mal_rollo = new NumericBadConsequence("Pierdes dos niveles y dos tesoros ocultos",2,0,2);
        
        unusedMonsters.add(new Monster("Semillas Cthulhu", 4, mal_rollo, new Prize(2,1)));
        
        //Dameargo
        mal_rollo = new SpecificBadConsequence("Te intentas escaquear. Pierdes una mano visible",0,
                    new ArrayList(Arrays.asList(TreasureKind.ONEHAND)),new ArrayList());
        
        unusedMonsters.add(new Monster("Dameargo",1, mal_rollo, new Prize(2,1)));
        
        //Pollipolipo volante
        mal_rollo = new NumericBadConsequence("Da mucho asquito. Pierdes tres niveles",3,0,0);
        
        unusedMonsters.add(new Monster("Pollipolipo volante", 3, mal_rollo, new Prize(1,1)));
        
        //Yskhtihyssg-Goth
        mal_rollo = new DeathBadConsequence("No le hace gracia que pronuncies mal su nombre. Estas muerto",0);
        
        unusedMonsters.add(new Monster("Yskhtihyssg-Goth", 12, mal_rollo, new Prize(3,1)));
        
        //Familia Feliz
        mal_rollo = new DeathBadConsequence("La familia te atrapa. Estas muerto",0);
        
        unusedMonsters.add(new Monster("La familia feliz", 1, mal_rollo, new Prize(4,1)));
        
        //Roboggoth
        mal_rollo = new SpecificBadConsequence("La quinta directiva primrai te obliga a perder dos niveles y un tesoro de dos manos visible",
                    2, new ArrayList (Arrays.asList(TreasureKind.BOTHHANDS)),new ArrayList());
        
        unusedMonsters.add(new Monster("Roboggoth", 8, mal_rollo, new Prize(2,1)));
        
        //El espia
        mal_rollo = new SpecificBadConsequence("Te asusta en la noche, pierdes un casco visible. Pierdes un casco visible",0,
                    new ArrayList (Arrays.asList(TreasureKind.HELMET)),new ArrayList());
        
        unusedMonsters.add(new Monster("El espia", 5, mal_rollo, new Prize(1,1)));
        
        //El lenguas
        mal_rollo = new NumericBadConsequence("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles",2,5,0);
         
        unusedMonsters.add(new Monster("El lenguas", 20, mal_rollo, new Prize(1,1)));
        
        //Bicefalo
        mal_rollo = new SpecificBadConsequence("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos",3,
                    new ArrayList (Arrays.asList(TreasureKind.ONEHAND,TreasureKind.BOTHHANDS)),new ArrayList());
         
        unusedMonsters.add(new Monster("Bicefalo", 20, mal_rollo, new Prize(1,1)));
        
        //El mal indecible impronunciable
        mal_rollo = new SpecificBadConsequence("Pierdes 1 mano visible",0,
                                        new ArrayList (Arrays.asList(TreasureKind.ONEHAND)),new ArrayList());
        unusedMonsters.add(new Monster("El mal indecible impronunciable",10,mal_rollo,new Prize(3,1),-2));
        
        //Testigos oculares
        mal_rollo = new NumericBadConsequence("Pierdes tus tesoros visibles. Jajaja",0,5,0);
        unusedMonsters.add(new Monster("Testigos oculares",6,mal_rollo,new Prize(2,1),2));
        
        //El gran cthulhu
        mal_rollo = new DeathBadConsequence("Hoy no es tu dia de suerte, mueres",0);
        unusedMonsters.add(new Monster("El gran cthulhu",20,mal_rollo, new Prize(2,5),4));
        
        //Serpiente Politico
        mal_rollo = new NumericBadConsequence("Tu gobierno te recorta 2 niveles",2,0,0);
        unusedMonsters.add(new Monster("Serpiente Politico",8,mal_rollo,new Prize(2,1),-2));
        
        //Felpuggoth
        mal_rollo = new SpecificBadConsequence("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas",0,
                                        new ArrayList (Arrays.asList(TreasureKind.HELMET,TreasureKind.ARMOR)),
                                        new ArrayList (Arrays.asList(TreasureKind.ONEHAND,TreasureKind.ONEHAND,TreasureKind.BOTHHANDS)));
        unusedMonsters.add(new Monster("Felpuggoth",2,mal_rollo,new Prize(1,1),4));
        
        //Shoggoth
        mal_rollo = new NumericBadConsequence("Pierdes dos niveles",2,0,0);
        unusedMonsters.add(new Monster("Shoggoth",16,mal_rollo,new Prize(4,2),-4));
        
        //Lolitagooth
        mal_rollo = new NumericBadConsequence("Pintalabios negro. Pierdes dos niveles",2,0,0);
        unusedMonsters.add(new Monster("Lolitagooth",2,mal_rollo,new Prize(1,1),3));
        
        shuffleMonsters();
    }
    
    private void initCultistCardDeck() {
        Cultist sectario;
        
        sectario = new Cultist("Sectario",1);
        unusedCultists.add(sectario);
        unusedCultists.add(sectario);
        unusedCultists.add(sectario);
        unusedCultists.add(sectario);
        sectario = new Cultist("Sectario",2);
        unusedCultists.add(sectario);
        unusedCultists.add(sectario);
        shuffleCultists();
    }
    
    private void shuffleCultists() {
        Collections.shuffle(unusedCultists);
    }
    
    private void shuffleTreasures(){
        
        Collections.shuffle(unusedTreasures);
    }
    
    private void shuffleMonsters(){
        
        Collections.shuffle(unusedMonsters);
    }
    
    /////////////////////////////////
    //////////////////////////////////
    
    public static CardDealer getInstance(){
        if(dealer == null){
            dealer = new CardDealer();
        }
        
        return dealer;
    }
    
    public Treasure nextTreasure(){
        if(unusedTreasures.isEmpty()){
            unusedTreasures = (ArrayList<Treasure>) usedTreasures.clone();
            usedTreasures.clear();
            shuffleTreasures();
        }
        Treasure aux = unusedTreasures.get(0);
        unusedTreasures.remove(0);
        
        return aux;
    }
    
    public Monster nextMonster(){
        if(unusedMonsters.isEmpty()){
            unusedMonsters = (ArrayList<Monster>) usedMonsters.clone();
            usedMonsters.clear();
            shuffleMonsters();
        }
        Monster aux = unusedMonsters.get(0);
        unusedMonsters.remove(0);
        
        return aux;
    }
    
    
    public Cultist nextCultist() {
        Cultist sectario;
        if(unusedCultists.isEmpty()){
            sectario = null; 
        }
        else {
            sectario = unusedCultists.get(0);
            unusedCultists.remove(0);
        }
        return sectario;
    }
    //--------------------------------------------------------------------
    
    public void giveTreasureBack(Treasure t){
        
        usedTreasures.add(t);
    }
    
    public void giveMonsterBack(Monster m){
        
        usedMonsters.add(m);
    }
    
    public void initCards(){
        initTreasureCardDeck();
        initMonsterCardDeck();
        initCultistCardDeck();
        
    }
    
    
}
