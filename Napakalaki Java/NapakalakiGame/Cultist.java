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
public class Cultist {
    
    private String name = null;
    private int gainedLevels = 0;
    
    public Cultist (String n, int l) {
        name = n;
        gainedLevels = l;
    }
    
    public int getGainedLevels() {
        return gainedLevels;
    }
}
