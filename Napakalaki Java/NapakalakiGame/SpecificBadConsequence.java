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
public class SpecificBadConsequence extends BadConsequence {
    private ArrayList<TreasureKind> specificVisibleTreasures = null;
    private ArrayList<TreasureKind> specificHiddenTreasures = null;
    
    public SpecificBadConsequence (String Text, int Levels, ArrayList<TreasureKind> tVisible,
                                 ArrayList<TreasureKind> tHidden) {
        super(Text, Levels);
        specificVisibleTreasures = tVisible;
        specificHiddenTreasures = tHidden;
    }
    
    @Override
    public String toString() {
        String cadena;
        
        cadena = "Levels = " + Integer.toString(levels);
                     
        if (specificVisibleTreasures != null) {
            cadena += " Specific Visible Treasures = ";
            for (TreasureKind specificVisibleTreasure : specificVisibleTreasures) 
                cadena += ", " + specificVisibleTreasure.toString();
        }     
        if(specificHiddenTreasures != null) {
            cadena += " Specific Hidden Treasures = ";
            for (TreasureKind specificHiddenTreasure : specificHiddenTreasures) 
                cadena += ", " + specificHiddenTreasure.toString();
        }
        
        return cadena;
    }
    
    @Override
    public boolean isEmpty(){
        return (specificVisibleTreasures.isEmpty() && specificHiddenTreasures.isEmpty());
    }
    
    public ArrayList<TreasureKind> getSpecificVisibleTreasures() {
     
         return specificVisibleTreasures;
    }
     
    public ArrayList<TreasureKind> getSpecificHiddenTreasures() {
     
        return specificHiddenTreasures;
    }
    
    @Override
    public void substractVisibleTreasure(Treasure t){ 
        specificVisibleTreasures.remove(t.getType());     
    }
    
    @Override
    public void substractHiddenTreasure(Treasure t){
        specificHiddenTreasures.remove(t.getType());
    }
    
    @Override
    public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v, ArrayList<Treasure> h) {
        SpecificBadConsequence malrollo;
        
        ArrayList<TreasureKind> copiav = new ArrayList();
        ArrayList<TreasureKind> copiah = new ArrayList();
        ArrayList<TreasureKind> vAjustado = new ArrayList();
        ArrayList<TreasureKind> hAjustado = new ArrayList();
                     
        for(Treasure tesoro: v){
            copiav.add(tesoro.getType());
        }
                      
        for(Treasure tesoro: h){
            copiah.add(tesoro.getType());
        }
                           
        for (TreasureKind  tipo : specificVisibleTreasures){
            if(copiav.contains(tipo)) {
                vAjustado.add(tipo);
                copiav.remove(tipo);
            }
        }
                    
        for (TreasureKind  tipo : specificHiddenTreasures){
            if(copiah.contains(tipo)){                           
                hAjustado.add(tipo);
                copiah.remove(tipo);
            }
        }
                    
        malrollo = new SpecificBadConsequence(text,levels,vAjustado,hAjustado);
        
        return malrollo;
    }
}
