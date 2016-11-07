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
public class NumericBadConsequence extends BadConsequence {
    
    private int nVisibleTreasures; //tesoros visibles que se pierden
    private int nHiddenTreasures; // tesoros ocultos que se pierden
    
    public NumericBadConsequence (String Text, int Levels, int nVisible, int nHidden) {
        super(Text, Levels);
        nVisibleTreasures = nVisible;
        nHiddenTreasures = nHidden;
    }
    
    public int getnVisibleTreasures () {
        return nVisibleTreasures;
    }
    
    public int getnHiddenTreasures () {
        return nHiddenTreasures;
    }
    
    @Override
    public String toString() {
        String cadena;
        cadena = "Levels = " + Integer.toString(super.levels) + 
                 " Visible treasures = " + Integer.toString(nVisibleTreasures) + 
                 " Hidden treasures = " + Integer.toString(nHiddenTreasures);
        
        return cadena;
    }
    
    //Preguntar si hay que dejarlo en la super clase
    @Override
    public boolean isEmpty() {
        return (nVisibleTreasures ==0 && nHiddenTreasures ==0);
    }
    
    @Override
    public void substractVisibleTreasure(Treasure t) {
        nVisibleTreasures--;
    } 
    
    @Override
    public void substractHiddenTreasure(Treasure t) {
        nHiddenTreasures--;
    }
    
    @Override
    public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v, ArrayList<Treasure> h) {
        NumericBadConsequence malrollo;
        malrollo = new NumericBadConsequence(super.text,levels,nVisibleTreasures,nHiddenTreasures);
        if(v.size()<nVisibleTreasures)
            malrollo.nVisibleTreasures = v.size();
        if(h.size()<nHiddenTreasures)
            malrollo.nHiddenTreasures = h.size();
        
        return malrollo;
    }
   
}
