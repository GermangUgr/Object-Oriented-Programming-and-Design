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
public class DeathBadConsequence extends NumericBadConsequence{
    private boolean death; //es o no mal rollo de tipo muerte
    
    public DeathBadConsequence(String Text, int Levels) {
        super (Text,Levels,5,5);
        death = true;
    }
    
    public boolean getDeath () {
        return death;
    }
    
    @Override
    public String toString() {
        return "Este mal rollo te mata";
    }
}
