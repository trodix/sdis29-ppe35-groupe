/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.form;

import com.test.bdd.UtilisateurMYSQL;
import com.test.beans.Utilisateur;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author fabien.ladouce
 */
public class AuthentifForm {
    
    private String resultat;

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }
    
    public String controlerAuthentif(HttpServletRequest request){
        
        UtilisateurMYSQL unUtilisateurMYSQL = new UtilisateurMYSQL("Aurelien","123");
        String nom = request.getParameter("ztLogin");
        String mdp = request.getParameter("ztMDP");
        
        Utilisateur unUtilisateur = new Utilisateur(nom, mdp);
        
        if(unUtilisateurMYSQL.equals(unUtilisateur)){
            System.out.println("test");
        }
        
        return resultat;
    }
    
    
    
}
