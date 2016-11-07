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
public class Prize {
    
    private  int level;
    private  int treasures;
    
    public Prize(int Treasures, int Level){
        
        treasures =Treasures;
        //Examen
        if(treasures > 5)
            treasures = 5;
        //Fin examen
        level = Level;
                
    } 
    
    public int GetTreasures(){
        
        return treasures;
    }
    
    public int Getlevel(){
        
        return level;
    }
    
    
    public String toString(){
        
        return "Nivel del premio: " + Integer.toString(level) + 
                "\nNumero de tesoros: " + Integer.toString(treasures);
           
    }
}
