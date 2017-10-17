/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.form;

import com.test.bdd.UtilisateurMYSQL;
import com.test.beans.Utilisateur;
import com.test.md5.Md5;
import java.sql.SQLException;
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
    
    public boolean controlerAuthentif(HttpServletRequest request) throws SQLException{
        
        boolean authentif = false;
        String nom = request.getParameter("ztLogin");
        String mdp = Md5.encode(request.getParameter("ztMDP"));
        System.out.println(mdp);
        
        //UtilisateurMYSQL unUtilisateurMYSQL = new UtilisateurMYSQL();
        //Utilisateur unUtilisateur = unUtilisateurMYSQL.read(nom, mdp);
        
        if(Md5.encode("123").equals(mdp)){
            System.out.println("test");
        }
//        if(unUtilisateur != null){
//            resultat = "Authentification réussi";
//            authentif = true;
//        }
        
        return authentif;
    }
    
    
    
}
