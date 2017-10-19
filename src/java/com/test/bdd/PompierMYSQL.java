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
import java.util.ArrayList;

/**
 *
 * @author sebastien.vallet
 */
public class PompierMYSQL {
    
    Connection laConnection = Connexion.getConnect("localhost","sdis29", "adminBDsdis", "mdpBDsdis");
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
                        getGrade(resultat.getString("pGrade")),
                        getStatut(resultat.getString("pStatut")),
                        resultat.getInt("pStatut"),
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
    
    public Pompier update(int cId, int pId, String pNom, String pPrenom, String pAdresse, 
            String pVille, int pCp, String pMail, String pCommentaire ) throws SQLException{
        
        Pompier unPompier = null;
        
        try{
            PreparedStatement prepStmt = null;
            String sql = "UPDATE pompier SET pNom = ?, pPrenom = ?, pAdresse = ?, pVille = ?, pCp = ?, pMail = ?, pCommentaire = ? WHERE cId = ? AND pId = ?";
            prepStmt = laConnection.prepareStatement(sql);
            prepStmt.setString(1, pNom);
            prepStmt.setString(2, pPrenom);
            prepStmt.setString(3, pAdresse);
            prepStmt.setString(4, pVille);
            prepStmt.setInt(5, pCp);
            prepStmt.setString(6, pMail);
            prepStmt.setString(7, pCommentaire);
            prepStmt.setInt(8, cId);
            prepStmt.setInt(9, pId);
            int Status = prepStmt.executeUpdate();
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return unPompier;
    }
    
    public ArrayList <Pompier> readAll(int nCaserne){
        ArrayList <Pompier> lesPompiers = new ArrayList();
        Pompier unPompier = null;
        
        try{
            PreparedStatement prepStmt = null;
            String sql = "SELECT * FROM pompier INNER JOIN caserne ON caserne.cId = pCis WHERE pCis = ? AND pType = 2";
            
            prepStmt = laConnection.prepareStatement(sql);
            prepStmt.setInt(1, nCaserne);
            ResultSet resultat = prepStmt.executeQuery();
            while(resultat.next()){
                unPompier = new Pompier(
                        resultat.getInt("pCis"), resultat.getInt("pId"), resultat.getString("pNom"),
                        resultat.getString("pPrenom"), resultat.getString("pAdresse"), 
                        resultat.getString("pVille"), resultat.getString("pCp"),
                        resultat.getString("pMail"), resultat.getString("pBip"),
                        getGrade(resultat.getString("pGrade")),
                        getStatut(resultat.getString("pStatut")),
                        resultat.getInt("pStatut"),
                        resultat.getString("pUrlPhoto"), resultat.getString("pCommentaire"),
                        resultat.getString("cNom"),resultat.getString("EmpRaisonSoc"), resultat.getString("EmpAdresse")
                );
                lesPompiers.add(unPompier);     
                idStatut = Integer.parseInt(resultat.getString("pStatut"));
            }
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return lesPompiers;
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
    
    public int getIsResponsable(String pStatut){
        
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
