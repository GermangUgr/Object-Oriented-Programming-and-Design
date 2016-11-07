/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NapakalakiGame;

/**
 *
 * @author Germán
 */
public class Treasure {
    private String name;
    private int bonus;
    private TreasureKind treasure;
    
    
    public Treasure(String n, int b, TreasureKind t) {
        name = n;
        bonus = b;
        treasure = t;
    }
    
    public String toString() {
        return "Nombre del tesoro: " + name + "\nBonus del tesoro: " 
                + Integer.toString(bonus)
                + "\nTipo de tesoro: " + treasure; 
        
    }
    
    public String getName () {
        
        return name;
    }
    
    public int getBonus () {
        
        return bonus;
    }
    
    public TreasureKind getType () {
        
        return treasure;
    }
}
