/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NapakalakiGame;


/**
 *
 * @author antoniomj
 */
public class Monster{
    
    private String name;
    private int combatLevel;
    private Prize premioMonstruo;
    private BadConsequence malRollo;
    private int levelChangeAgainstCultistPlayer;
    
    public Monster(String Name, int CombatLevel, BadConsequence MalRollo, Prize PremioMonstruo){
        
        name = Name;
        combatLevel = CombatLevel;
        malRollo = MalRollo;
        premioMonstruo = PremioMonstruo;
        levelChangeAgainstCultistPlayer = 0;
        
    }
    
    public Monster(String Name, int CombatLevel, BadConsequence MalRollo, Prize PremioMonstruo, int levelChange){
        
        name = Name;
        combatLevel = CombatLevel;
        malRollo = MalRollo;
        premioMonstruo = PremioMonstruo;
        levelChangeAgainstCultistPlayer = levelChange;
        
    }
    
    public int getCombatLevelAgainstCultistPlayer() {
        return levelChangeAgainstCultistPlayer + combatLevel;
    }
    
    public String Getname(){
        
        return name;
    }
    
    public int GetCombatLevel(){
        
        return combatLevel;
    }
    
    public BadConsequence GetMalRollo(){
        
        return malRollo;
        
    }
    
    public Prize GetPremio(){
        
        return premioMonstruo;
    }
    public String toString(){
        
        return "Nombre del monstruo: " + name + "\nNivel del monstruo: " 
                + Integer.toString(combatLevel)
                + "\nPremio del monstruo: " + premioMonstruo.toString() +
                "\nMal Rollo: " + malRollo.toString(); 
        
    }
    
    public void SetMalRollo(BadConsequence mal_rollo){
        
        malRollo = mal_rollo;
        
    }
    
    public int getLevelsGained(){
        int niveles;
        niveles = premioMonstruo.Getlevel();
     
        return niveles;
    }
    
    public int getTreasuresGained(){
        int tesoros;
        tesoros = premioMonstruo.GetTreasures();
     
        return tesoros;
    }
}
