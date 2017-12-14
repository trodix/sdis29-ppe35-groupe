/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.bdd;

import com.test.beans.Pompier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *
 * @author sebastien.vallet
 */
public class InterventionMySQL {
    
    Connection laConnection = Connexion.getConnect("localhost","sdis29", "adminBDsdis", "mdpBDsdis");
    //Connection laConnection = Connexion.getConnect("10.121.38.193","sdis29", "adminBDsdis", "mdpBDsdis");
    
    public ArrayList <String> readLesCasernes() throws SQLException{
        
        ArrayList <String> lesCasernes = new ArrayList();
        
        try{
            PreparedStatement prepStmt = null;
            String sql = "SELECT cNom FROM caserne";
            prepStmt = laConnection.prepareStatement(sql);
            ResultSet resultat = prepStmt.executeQuery();
            while(resultat.next()){
                lesCasernes.add(resultat.getString("cNom"));
            }
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return lesCasernes;
    }
    
    public Pompier update() throws SQLException{
        
        Pompier unPompier = null;
        
        try{
            PreparedStatement prepStmt = null;
            String sql = "UPDATE pompier SET pNom = ?, pPrenom = ?, pAdresse = ?, pVille = ?, pCp = ?, pMail = ?, pCommentaire = ?, pIdCreation = ?, pDateEnreg = NOW() WHERE pCis = ? AND pId = ?";
            prepStmt = laConnection.prepareStatement(sql);
            
            int Status = prepStmt.executeUpdate();
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return unPompier;
    }
    
    
    public ArrayList<Pompier> getLesPompiersDispo(String nomCaserne){
        
        ArrayList <Pompier> lesPompiersDispo = new ArrayList();
        try{
            PreparedStatement prepStmt = null;
            String sql = "SELECT * FROM pompier " +
                            "INNER JOIN caserne ON caserne.cId = pompier.pCis " +
                            "INNER JOIN feuillegarde ON feuillegarde.idCis = pompier.pCis AND feuillegarde.idPompier " +
                            "WHERE cNom=? AND feuillegarde.idDispo IN(0,1,2) AND pType = 2" +
                            "GROUP BY pompier.pId";
            prepStmt = laConnection.prepareStatement(sql);
            prepStmt.setString(1,nomCaserne);
            ResultSet resultat = prepStmt.executeQuery();
            Pompier unPompier = null;
            while(resultat.next()){
                unPompier = new Pompier(
                        resultat.getInt("pCis"), resultat.getInt("pId"), resultat.getString("pNom"),
                        resultat.getString("pPrenom"), resultat.getString("pAdresse"), 
                        resultat.getString("pVille"), resultat.getString("pCp"),
                        resultat.getString("pMail"), resultat.getString("pBip"),
                        resultat.getString("pGrade"),
                        resultat.getString("pStatut"),
                        resultat.getInt("pStatut"),
                        resultat.getString("pUrlPhoto"), resultat.getString("pCommentaire"),
                        resultat.getString("cNom"),resultat.getString("EmpRaisonSoc"), resultat.getString("EmpAdresse"));
                lesPompiersDispo.add(unPompier);
            }
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return lesPompiersDispo;
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
    
    public Pompier create(int nCaserne,int id,String nom, String prenom,int statut,int type,String mail,String login,
            String mdp, String adresse,int cp,String ville, int bip,String com,String urlPhoto,String raisonSoc,String EmplAdresse,int idCreation) throws SQLException{
        Pompier unPompier = null;
        
        try{
            PreparedStatement prepStmt = null;
            String sql = "INSERT INTO `pompier` (`pCis`,`pId`,`pNom`, `pPrenom`,"
                    + " `pStatut`, `pType`, `pMail`, `pLogin`, `pMdp`, `pAdresse`,"
                    + " `pCp`, `pVille`, `pBip`,`pCommentaire`,"
                    + " `pDateEnreg`, `pDateModif`, `pUrlPhoto`, `EmpRaisonSoc`, `EmpAdresse`,"
                    + " `pIdCreation`, `pIdModif`) "
                    + "VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            prepStmt = laConnection.prepareStatement(sql);
            prepStmt.setInt(1, nCaserne);
            prepStmt.setInt(2, id);
            prepStmt.setString(3, nom);
            prepStmt.setString(4 ,prenom);
            prepStmt.setInt(5, statut);
            prepStmt.setInt(6, type);
            prepStmt.setString(7, mail);
            prepStmt.setString(8, login);
            prepStmt.setString(9, mdp);
            prepStmt.setString(10, adresse);
            prepStmt.setInt(11, cp);
            prepStmt.setString(12, ville);
            prepStmt.setInt(13, bip);
            prepStmt.setString(14, com);
            java.util.Date date_util = new java.util.Date();
            java.sql.Date date_sql = new java.sql.Date(date_util.getTime());
            prepStmt.setDate(15, date_sql);
            prepStmt.setDate(16, date_sql);
            prepStmt.setString(17, urlPhoto);
            prepStmt.setString(18, raisonSoc);
            prepStmt.setString(19, EmplAdresse);        
            prepStmt.setInt(20, idCreation);
            prepStmt.setInt(21, idCreation);

            
            
            
            int resultat = prepStmt.executeUpdate();
        }catch (SQLException ex){
            System.out.println("SQLException : " + ex.getMessage());
            System.out.println("SQLException : " + ex.getSQLState());
            System.out.println("SQLException : " + ex.getErrorCode());
        }
        return unPompier;
    }
    
}
