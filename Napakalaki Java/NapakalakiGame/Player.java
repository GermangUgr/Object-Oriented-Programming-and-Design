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
 * @author Germán
 */

import GUI.Dice;

public class Player {
    static final int MAXLEVEL = 10;
    private String name;
    private int level;
    private boolean dead;
    private boolean canISteal;
    protected Player enemy;
    private BadConsequence pendingBadConsequence = null;
    private ArrayList<Treasure> VisibleTreasures = null;
    private ArrayList<Treasure> HiddenTreasures = null;
    
    
    //Metodos con visibilidad privada
    
    private void bringToLife(){
    
        dead = false;
    }
    
    private void incrementLevels(int i){
    
        level += i;
        if(level >10)
           level = 10;
        
    }
    
    private void decrementLevels(int i) {
    
        level -= i;
        if(level < 1)
            level = 1;
    }
    
    private void setPendingBadConsequence(BadConsequence b) {
        
        pendingBadConsequence = b;
    }
    
    private void applyPrize(Monster m) {
    
        int nLevels = m.getLevelsGained();
        incrementLevels(nLevels);
        int nTreasures = m.getTreasuresGained();
        Treasure treasure;
        CardDealer dealer;
        
        if(nTreasures>0){
            
            dealer = CardDealer.getInstance();
            for(int i=0;i<nTreasures;i++){
                treasure = dealer.nextTreasure();
                HiddenTreasures.add(treasure);
            }
            
        }
    }
    
    private void applyBadConsequence(Monster m) {
    
        BadConsequence badconsequence = m.GetMalRollo();
        int nLevels = badconsequence.getLevel();
        decrementLevels(nLevels);
        BadConsequence pendingBad = badconsequence.adjustToFitTreasureLists(VisibleTreasures, HiddenTreasures);
        setPendingBadConsequence(pendingBad);
    }
    
    private boolean canMakeTreasureVisible(Treasure t) {
    
        boolean permitido = true;
        int contador =0;    
        int i;
        
        if(t.getType() == TreasureKind.ONEHAND){
            for(i=0;i<VisibleTreasures.size() && permitido;i++){
                if((VisibleTreasures.get(i)).getType() == TreasureKind.BOTHHANDS)
                    permitido = false;
            }
            
            if(permitido){
                for(i=0;i<VisibleTreasures.size();i++){
                    if((VisibleTreasures.get(i)).getType() == TreasureKind.ONEHAND)
                        contador++;
                }
            }
            
            if(contador == 2)
                permitido = false;
        }else{
           if(t.getType() == TreasureKind.BOTHHANDS){
               for(i=0;i<VisibleTreasures.size() && permitido;i++){
                if((VisibleTreasures.get(i)).getType() == TreasureKind.ONEHAND)
                    permitido = false;
                }
               
               for(i=0;i<VisibleTreasures.size() && permitido;i++){
                if((VisibleTreasures.get(i)).getType() == TreasureKind.BOTHHANDS)
                    permitido = false;
                }
           }else{
               for(i=0;i<VisibleTreasures.size();i++){
                    if(t.getType() == (VisibleTreasures.get(i)).getType())
                      permitido=false; 
                }    
           }
        }
           
        return permitido;
    }
    
    private int howManyVisibleTreasures (TreasureKind tkind) {
    
        int i;
        int contador=0;
    
        for(i=0; i < VisibleTreasures.size();i++){
            if((VisibleTreasures.get(i)).getType() == tkind)
                contador++;
        }
        
        return contador;
    }
    
    private void dieIfNoTreasures(){
    
        if(VisibleTreasures.isEmpty() && HiddenTreasures.isEmpty()){
            
            dead = true;
            level = 1;
            
        }
    }
    
    private void haveStolen() {
    
        canISteal = false;
    }
    
    //Metodos con visibilidad publica
    
    public Player(String nombre) {
        name = nombre;
        level = 1;
        dead = true;
        canISteal = true;
        enemy = null;
        pendingBadConsequence = new NumericBadConsequence("",0,0,0);
        VisibleTreasures = new ArrayList();
        HiddenTreasures = new ArrayList();
    }
    
    
    //Metodos redefinidos en la clase CultistPlayer-----------------
    //--------------------------------------------------------------
    protected Player (Player p) {
        this.name = p.getName();
        this.level = p.getLevels();
        this.dead = p.isDead();
        this.canISteal = p.canISteal();
        this.enemy = p.enemy;
        this.pendingBadConsequence = p.pendingBadConsequence;
        this.VisibleTreasures = p.getVisibleTreasures();
        this.HiddenTreasures = p.getHiddenTreasures();
    }
    
    protected Treasure giveMeATreasure () {
    
        Treasure tesoro;
        Random rand = new Random();
        int resultado = rand.nextInt(HiddenTreasures.size());
        tesoro = HiddenTreasures.get(resultado);
        HiddenTreasures.remove(tesoro);
        return tesoro;
    }
    
    public boolean canYouGiveMeATreasure() {
    
        boolean me_pueden_robar = false;
        
        if(HiddenTreasures.size() > 0)
                me_pueden_robar = true;
        
        return me_pueden_robar;
    }
    
    protected int getOponentLevel(Monster m) {
        return m.GetCombatLevel();
    }
    
    protected boolean shouldConvert() {
        Dice dado = Dice.getInstance();
        int resultado = dado.nextNumber();
        return (resultado == 1);
    }
    
    public int getCombatLevel() {
        
        int i,nivel;
        nivel = level;    
    
        for(i=0;i<VisibleTreasures.size();i++){
            nivel += (VisibleTreasures.get(i)).getBonus();
        }
        
        return nivel;  
        
    }
    //--------------------------------------------------------------
    
    @Override
    public String toString() {
        return name; 
    }
    
    public String getName() {
    
        return name;
    }
    
    public int getLevels() {
    
        return level;
    }
    
    public Player getEnemy() {
        return enemy;
    }
    
    public BadConsequence getPendingBC(){
        return pendingBadConsequence;
    }
    
    public boolean isDead() {
    
        return dead;
    }
    
    //Es necesario definir este metodo para poder usarlo en la clase CultistPlayer
    //en giveMeATreasure
    protected void setVisibleTreasures(ArrayList<Treasure> ts) {
        VisibleTreasures = ts;
    }
    
    public ArrayList<Treasure> getHiddenTreasures () {
    
        return HiddenTreasures;
    }
    
    public ArrayList<Treasure> getVisibleTreasures () {
    
        return VisibleTreasures;
    }
    
    
    
    public CombatResult combat (Monster m) {
    
        CombatResult resultado;
        
        int myLevel = this.getCombatLevel();
        int monsterLevel = getOponentLevel(m);

        if(myLevel > monsterLevel){
        
            resultado = CombatResult.WIN;
            applyPrize(m);
        }else{
            
            resultado = CombatResult.LOSE;
            applyBadConsequence(m);    
        }
        
        if(resultado == CombatResult.LOSE) {
            if(this.shouldConvert())
                resultado = CombatResult.LOOSEANDCONVERT;
        }
        
        if(level > 9)
            resultado = CombatResult.WINGAME;
        
        return resultado;
    }
    
    public void makeTreasureVisible (Treasure t) {
    
        boolean canI = canMakeTreasureVisible(t);
        
        if(canI){
            VisibleTreasures.add(t);
            HiddenTreasures.remove(t);
        }
    }
    
    public void discardVisibleTreasure(Treasure t) {
    
        VisibleTreasures.remove(t);
        
        if(pendingBadConsequence!=null && !pendingBadConsequence.isEmpty()){
        
            pendingBadConsequence.substractVisibleTreasure(t);
        }
        
        dieIfNoTreasures();
    }
    
    public void discardHiddenTreasure(Treasure t) {
    
        HiddenTreasures.remove(t);
        
        if(pendingBadConsequence!=null && !pendingBadConsequence.isEmpty()){
        
            pendingBadConsequence.substractHiddenTreasure(t);
        }
        
        dieIfNoTreasures();
        
    }
    
    public boolean validState() {
        boolean valido;
    
        valido = HiddenTreasures.size() < 5 && pendingBadConsequence.isEmpty();
        return valido;
    }
    
    public Treasure stealTreasure() {
    
        Treasure treasure = null;
        boolean canI = canISteal();
        boolean canYou;
        
        if(canI){
            
            canYou = enemy.canYouGiveMeATreasure();
            if(canYou){
                
                treasure = enemy.giveMeATreasure();
                HiddenTreasures.add(treasure);
                haveStolen();
            }
        }
        
        return treasure;
    }
    
    public void setEnemy(Player enemigo) {
    
        enemy = enemigo;
    }
    
    public boolean canISteal () {
    
        return canISteal;
    }
    
    public void discardAllTreasures() {
    
        while(!VisibleTreasures.isEmpty()){
            discardVisibleTreasure(VisibleTreasures.get(0));
        }  
        
        while (!HiddenTreasures.isEmpty()){
            discardHiddenTreasure(HiddenTreasures.get(0));
        }  
        
    }
    
    public void initTreasures(){
    
        CardDealer dealer = CardDealer.getInstance();
        Dice dice = Dice.getInstance();
        
        bringToLife();
        Treasure tesoro = dealer.nextTreasure();
        HiddenTreasures.add(tesoro);
        
        int number = dice.nextNumber();
        if(number>1){
            tesoro = dealer.nextTreasure();
            HiddenTreasures.add(tesoro);
        }
        
        if(number ==6){
            tesoro = dealer.nextTreasure();
            HiddenTreasures.add(tesoro);
        }
      
    }
 
}


//Para barajar: Collection.shuffle(mi_array)