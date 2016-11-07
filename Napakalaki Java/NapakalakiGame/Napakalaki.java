/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NapakalakiGame;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author Antonio
 */
public class Napakalaki {
    
    //////////////////////////////////////////////////
    /////////////////////////////////////////////
    private static Napakalaki game = null;
    private Monster currentMonster = null;
    private CardDealer dealer = null;
    private ArrayList<Player> players = null;
    private Player currentPlayer = null;
            
    
    private Napakalaki(){
        
        currentMonster = null;
        currentPlayer = null;
        dealer =  CardDealer.getInstance();
        players = new ArrayList();
       
    
    }
    
    private void initPlayers(ArrayList<String> names){
        for (String name : names) {
            players.add(new Player(name));
        }      
    }
    
    private Player nextPlayer(){
        Player next = null;
        Random rand = new Random();
        if(currentPlayer == null) {
            next = players.get(rand.nextInt(players.size()));
        } else {
            for (int i=0; i<players.size();i++)
                if (players.get(i)==currentPlayer)
                    next = players.get((i+1)%players.size());
        }
        currentPlayer = next;
        return next;
    }
    
    private boolean nextTurnAllowed(){
        boolean allowed;
        if(currentPlayer != null)
            allowed = currentPlayer.validState();
        else 
            allowed = true;
        
        return allowed;
    }
    
    private void setEnemies(){
        boolean asignado = false;
        int aux;
        int pos;
        if(players.size() == 1){
            Player p = players.get(0);
            p.setEnemy(p);
        }else{
            for (Player  player : players) {
                asignado = false;
                while (!asignado) {
                    aux = (int) (Math.random()*(players.size()));
                    pos = players.indexOf(player);        
                    if (pos != aux) {
                        player.setEnemy(players.get(aux));
                        asignado = true;
                    }
                }
            }
        }
    }
    
    ///////////////////////////////////////
    ///////////////////////////////////////
    public static Napakalaki getInstance(){
        if(game == null){
            game = new Napakalaki();
        }
        return game;
    }
    
    public CombatResult developCombat(){
        CombatResult resultado;
        
        resultado = currentPlayer.combat(currentMonster);
        dealer.giveMonsterBack(currentMonster);
        
        if(resultado == CombatResult.LOOSEANDCONVERT) {
            Cultist sectario = dealer.nextCultist();
            CultistPlayer cultistP = new CultistPlayer(currentPlayer, sectario);
            int indice = players.indexOf(currentPlayer);
            players.set(indice, cultistP); 
            for(Player p:players) {
                if(p.getEnemy() == currentPlayer)
                    p.setEnemy(cultistP);
            }
            
            currentPlayer = cultistP;

        }
      
        
        return resultado;
        
    }
    
    public void discardVisibleTreasures(ArrayList<Treasure> treasures){
        
        ArrayList<Treasure> aux = currentPlayer.getVisibleTreasures();
       
        for (Treasure  tesoro : treasures){
            
                currentPlayer.discardVisibleTreasure(tesoro);
                dealer.giveTreasureBack(tesoro);
        }
        
    }
    
    public void discardHiddenTreasures(ArrayList<Treasure> treasures){
        
        ArrayList<Treasure> aux = currentPlayer.getHiddenTreasures();
     
        for (Treasure  tesoro : treasures){
       
                currentPlayer.discardHiddenTreasure(tesoro);
                dealer.giveTreasureBack(tesoro);
            
        }
        
    }
    
    public void makeTreasuresVisible(ArrayList<Treasure> treasures){
        
        for (Treasure  tesoro : treasures){
            currentPlayer.makeTreasureVisible(tesoro);
        }
        
    }
    
    public void initGame(ArrayList<String> nombres){
        initPlayers(nombres);      
        setEnemies();
        dealer.initCards();
        nextTurn();              
    }
    
    public Player getCurrentPlayer(){
        return currentPlayer;
    }
    
    public Monster getCurrentMonster(){
        return currentMonster;
        
    }
    
    public boolean nextTurn(){
        boolean continuar = nextTurnAllowed();
        
        if(continuar){
            currentMonster = dealer.nextMonster();  
            currentPlayer = nextPlayer();
            if(currentPlayer.isDead()){
                currentPlayer.initTreasures();
            }    
        }
        return continuar;
    }
    
    public boolean endOfGame(CombatResult result){
        return result == CombatResult.WINGAME;
    }
       
}
