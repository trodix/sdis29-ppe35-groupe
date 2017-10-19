/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.bdd;

import com.test.beans.Utilisateur;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;



/**
 *
 * @author fabien.ladouce
 */
public class UtilisateurMYSQL {
        
    //Connection laConnection = Connexion.getConnect("ppe35test","sdis29", "adminBDsdis", "mdpBDsdis");
    Connection laConnection = Connexion.getConnect("localhost","sdis29", "adminBDsdis", "mdpBDsdis");
    //Connection laConnection = Connexion.getConnect("10.121.38.193","sdis29", "adminBDsdis", "mdpBDsdis");
    
    public Utilisateur read(String nom, String password) throws SQLException{
        Utilisateur unUtilisateur = null;
        
        try{
            PreparedStatement prepStmt = null;
            String sql = "SELECT pLogin,pMdp,pId,pCis FROM pompier WHERE pLogin = ? AND pMdp = ?";
            prepStmt = laConnection.prepareStatement(sql);
            prepStmt.setString(1, nom);
            prepStmt.setString(2, password);
            ResultSet resultat = prepStmt.executeQuery();
            if(resultat.first()){
                unUtilisateur = new Utilisateur(resultat.getString("pLogin"), resultat.getString("pMdp"), resultat.getInt("pId"),resultat.getInt("pCis"));
            }
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return unUtilisateur;
    }
   
    
}