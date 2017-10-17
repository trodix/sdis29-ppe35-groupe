/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.bdd;

import com.test.beans.Pompier;
import com.test.beans.Pompier;
import com.test.beans.Utilisateur;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sebastien.vallet
 */
public class PompierMYSQL {
    
    Connection laConnection = Connexion.getConnect("ppe35test","sdis29", "adminBDsdis", "mdpBDsdis");
    
    public Pompier read(String nom, String password) throws SQLException{
        Pompier unPompier = null;
        
        try{
            PreparedStatement prepStmt = null;
            String sql = "SELECT cId, pId, pNom, pPrenom, pAdresse, pVille, pCp, pMail, pBip, pUrlPhoto, pCommentaire, cNom FROM pompier INNER JOIN caserne ON pCis = cId WHERE pCis = 2901 AND pId = 1";
            prepStmt = laConnection.prepareStatement(sql);
            prepStmt.setString(1, nom);
            prepStmt.setString(2, password);
            ResultSet resultat = prepStmt.executeQuery();
            if(resultat.first()){
                unPompier = new Pompier(
                        resultat.getInt("cId"), resultat.getInt("pId"), resultat.getString("pNom"),
                        resultat.getString("pPrenom"), resultat.getString("pAdresse"), 
                        resultat.getString("pVille"), resultat.getString("pCp"),
                        resultat.getString("pMail"), resultat.getString("pBip"),
                        resultat.getString("pUrlPhoto"), resultat.getString("pCommentaire"),
                        resultat.getString("cNom")
                );
            }
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return unPompier;
    }
    
}
