/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NapakalakiGame;

import java.util.ArrayList;

/**
 *
 * @author Germán
 */
public class CultistPlayer extends Player {
    private static int totalCultistPlayers = 0;
    private Cultist myCultistCard = null;
    
    public CultistPlayer(Player p, Cultist c){
        super(p);
        //System.out.println("Se convierte en sectario\n");
        totalCultistPlayers++;
        myCultistCard = c;
    }
   
    @Override
    protected boolean shouldConvert() {
        return false;
    }
    
    @Override
    public int getCombatLevel(){
        double nivel;
        nivel = super.getCombatLevel() + super.getCombatLevel()*0.2;
        nivel += myCultistCard.getGainedLevels()*totalCultistPlayers;
        return (int) nivel;
    }
    
    @Override
    protected int getOponentLevel(Monster m) {
        return m.getCombatLevelAgainstCultistPlayer();
    }
    
    public static int getTotalCultistPlayers() {
        return totalCultistPlayers;
    }
    
    @Override
    protected Treasure giveMeATreasure() {
        Treasure tesoro;
        ArrayList<Treasure> tesoros = getVisibleTreasures();
        tesoro = tesoros.get((int) (Math.random()*tesoros.size()));
        tesoros.remove(tesoro);
        super.setVisibleTreasures(tesoros);
        return tesoro;
    }
    
   @Override 
   public boolean canYouGiveMeATreasure() {
       return !(getVisibleTreasures().isEmpty());
   }
            
    
}
