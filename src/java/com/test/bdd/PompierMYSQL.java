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
    
    Connection laConnection = Connexion.getConnect("10.121.38.193","sdis29", "adminBDsdis", "mdpBDsdis");
    int idStatut = 0;
    
    public Pompier read(int nCaserne, int pId) throws SQLException{
        Pompier unPompier = null;
        
        try{
            PreparedStatement prepStmt = null;
            String sql = "SELECT * FROM pompier INNER JOIN caserne ON caserne.cId = pCis WHERE pCis = ? AND pId = ?";
            prepStmt = laConnection.prepareStatement(sql);
            prepStmt.setInt(1, nCaserne);
            prepStmt.setInt(2, pId);
            ResultSet resultat = prepStmt.executeQuery();
            if(resultat.first()){
                unPompier = new Pompier(
                        resultat.getInt("pCis"), resultat.getInt("pId"), resultat.getString("pNom"),
                        resultat.getString("pPrenom"), resultat.getString("pAdresse"), 
                        resultat.getString("pVille"), resultat.getString("pCp"),
                        resultat.getString("pMail"), resultat.getString("pBip"),
                        getGrade(resultat.getString("pGrade")),getStatut(resultat.getString("pStatut")),
                        resultat.getString("pUrlPhoto"), resultat.getString("pCommentaire"),
                        resultat.getString("cNom"),resultat.getString("EmpRaisonSoc"), resultat.getString("EmpAdresse")
                );
                idStatut = Integer.parseInt(resultat.getString("pStatut"));
            }
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return unPompier;
    }
    
    public Pompier update(int cId, int pId) throws SQLException{
        Pompier unPompier = null;
        
        try{
            PreparedStatement prepStmt = null;
            String sql = "";
            prepStmt = laConnection.prepareStatement(sql);
//            prepStmt.setString(1, login);
//            prepStmt.setString(2, mdp);
            ResultSet resultat = prepStmt.executeQuery();
            if(resultat.first()){
                
            }
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return unPompier;
    }
    
    public String getGrade(String pGrade){
        
        String grade = "";
        try{
            PreparedStatement prepStmt = null;
            String sql = "SELECT pLibelle FROM parametre WHERE pType ='grade' AND pIndice = ?";
            prepStmt = laConnection.prepareStatement(sql);
            prepStmt.setInt(1, Integer.parseInt(pGrade));
            ResultSet resultat = prepStmt.executeQuery();
            if(resultat.first()){
                grade = resultat.getString("pLibelle");
            }
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return grade;
    }
    
    public String getStatut(String pStatut){
        
        String statut = "";
        try{
            PreparedStatement prepStmt = null;
            String sql = "SELECT pLibelle FROM parametre WHERE pType ='typePer' AND pIndice = ?";
            prepStmt = laConnection.prepareStatement(sql);
            prepStmt.setInt(1, Integer.parseInt(pStatut));
            ResultSet resultat = prepStmt.executeQuery();
            if(resultat.first()){
                statut = resultat.getString("pLibelle");
            }
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return statut;
    }
    
    public int getIsResponsable(){
        
        int responsable = 0;
        try{
            PreparedStatement prepStmt = null;
            String sql = "SELECT pIndice FROM parametre WHERE pType ='statAgt'";
            prepStmt = laConnection.prepareStatement(sql);
            ResultSet resultat = prepStmt.executeQuery();
            if(resultat.first()){
                responsable = resultat.getInt("pIndice");
            }
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return responsable;
    }
    
}
