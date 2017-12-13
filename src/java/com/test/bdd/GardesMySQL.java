package com.test.bdd;

import com.personnelTP.util.TrmtDate;
import com.test.bdd.Connexion;
import com.test.beans.Pompier;
import com.test.beans.Gardes;
import com.test.bdd.PompierMYSQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author aurelien.thazet
 */
public class GardesMySQL {
    private final Connection laConnection  = Connexion.getConnect("Localhost", 
                                                                "sdis29", 
                                                                "adminBDsdis", 
                                                                "mdpBDsdis");
    
    public ArrayList<Gardes> getLesGardes(int nCaserne) throws SQLException, ParseException{
        
        ArrayList <Gardes> lesGardes = new ArrayList();
        ArrayList <Pompier> lesPompiers = new ArrayList();
        ArrayList <Calendar> lesDates = new ArrayList();
        PompierMYSQL unPompierMysql = new PompierMYSQL();
        ArrayList <Integer> lesPeriodes = new ArrayList();
        lesPeriodes.add(1);
        lesPeriodes.add(2);
        lesPeriodes.add(3);
        lesPeriodes.add(4);
        for(int i = 0; i<7; i++){
            Calendar c = TrmtDate.addDays(TrmtDate.getDateDebutSemaine(), i);
            lesDates.add(c);
            }
        //ArrayList <Pompier> lesPompiers = new ArrayList();
        //for(Pompier unPompier : lesPompiers){
        
        Calendar dateTraitee;
        lesPompiers = unPompierMysql.readAll(nCaserne);
        Calendar dateDebut = lesDates.get(0);
        Calendar dateFin = lesDates.get(lesDates.size()-1);
        System.out.println(lesPompiers);
        for(Pompier unPompier1 : lesPompiers){
            dateTraitee = TrmtDate.getClone(dateDebut);
            int i = 0;
            while (dateTraitee.compareTo(dateFin) <= 0) {
                
                    for (Integer unePeriode:lesPeriodes) {
                        Gardes uneGarde = new Gardes(dateTraitee, unePeriode, unPompier1,0);
                        lesGardes.add(uneGarde);
                    }
                dateTraitee=TrmtDate.addDays(dateTraitee, 1); 
            }
        }
        PreparedStatement prepStmt = null;
        String sql = "SELECT idCis, idPompier, dteJour, horaires.idHoraires, horaires.libelle, idDispo,disponibilite.libelle FROM feuilleGarde " +
                       "INNER JOIN pompier ON pompier.pCis = idCis AND pompier.pId = idPompier " +
                        "INNER JOIN horaires ON horaires.idHoraires = feuilleGarde.idHoraires " +
                        "INNER JOIN disponibilite ON disponibilite.idDisponibilite = feuilleGarde.idDispo " +
                        "WHERE idCis = ?" +
                        " ORDER BY idCis,idPompier,dteJour,feuilleGarde.idHoraires";
        prepStmt = laConnection.prepareStatement(sql);
        prepStmt.setInt(1, nCaserne);
        ResultSet resultat = prepStmt.executeQuery();
        Calendar c = TrmtDate.getDateDebutSemaine();
        while(resultat.next()){
            Pompier unPompier = unPompierMysql.read(resultat.getInt("idCis"), resultat.getInt("idPompier"));
            Gardes uneGarde = new Gardes(TrmtDate.getCalDate(resultat.getDate("dteJour")), resultat.getInt("idHoraires"), unPompier, resultat.getInt("idDispo"));
            int indice = lesGardes.indexOf(uneGarde);
                if (indice > -1 ) {
                    uneGarde = lesGardes.get(indice);
                } 
                uneGarde.setActivite(resultat.getInt("idDispo"));
                uneGarde.setIsInBdd(true);
                if (indice==-1) {
                    lesGardes.add(uneGarde);
                }
        }

        
        return lesGardes;
        }
    
    public void update(Gardes uneGarde, int act) {

        try {           
            PreparedStatement stmt;
            String sql = "UPDATE feuilleGarde SET idDispo = ? WHERE "
                    + "dtJour=? AND idHoraires=? AND idPompier=? AND idCis=?";
            stmt = laConnection.prepareStatement(sql);
            stmt.setInt(1, act);
            stmt.setDate(2, TrmtDate.getSQLDate(uneGarde.getJourGarde()));
            stmt.setInt(3, uneGarde.getHoraires());
            stmt.setInt(4, uneGarde.getPompier().getpId());
            stmt.setInt(5, uneGarde.getPompier().getcId());
            
            // System.out.println("Requete : " + stmt.toString());
            int statut = stmt.executeUpdate();            
            if (statut <= 0) {
                System.out.println("Pb lors de la maj dans feuilleGarde");
                System.out.println("Requete : " + stmt.toString());
            }
            stmt.close();  
        } catch(SQLException ex){
            System.out.println("SQLExecption : " + ex.getMessage());
            System.out.println("SQLState : " + ex.getSQLState());
            System.out.println("CodeErreur : " + ex.getErrorCode());
        }
        
    }
    public void create(Gardes uneGarde, int act) {
        
        try {           
            PreparedStatement stmt;
            String sql = "INSERT INTO ventilation VALUES (?,?,?,?);";
            stmt = laConnection.prepareStatement(sql);
            stmt.setDate(1, TrmtDate.getSQLDate(uneVentil.getJourVentil()));
            stmt.setString(2, uneVentil.getPeriode());
            stmt.setInt(3, uneVentil.getSalarie().getId());
            stmt.setInt(4, act);
            // System.out.println("Requete : " + stmt.toString());
            int statut = stmt.executeUpdate();            
            if (statut <= 0) {
                System.out.println("Pas d'insertion dans ventilation");
                System.out.println("Requete : " + stmt.toString());
            }
            stmt.close();  
        } catch(SQLException ex){
            System.out.println("SQLExecption : " + ex.getMessage());
            System.out.println("SQLState : " + ex.getSQLState());
            System.out.println("CodeErreur : " + ex.getErrorCode());
        }
    }
    public void delete(Gardes uneGarde) {
        System.out.println("uneVentil à supprimer : "+ uneVentil);
        try {           
            PreparedStatement stmt;
            String sql = "DELETE FROM ventilation WHERE "
                    + "jourVentil=? AND periode=? AND idSalarie=?;";
            stmt = laConnection.prepareStatement(sql);
            stmt.setDate(1, TrmtDate.getSQLDate(uneVentil.getJourVentil()));
            stmt.setString(2, uneVentil.getPeriode());
            stmt.setInt(3, uneVentil.getSalarie().getId());
            // System.out.println("Requete : " + stmt.toString());
            int statut = stmt.executeUpdate();            
            if (statut <= 0) {
                System.out.println("Suppression non effectuée");
                System.out.println("Requete : " + stmt.toString());
            }
            stmt.close();  
        } catch(SQLException ex){
            System.out.println("SQLExecption : " + ex.getMessage());
            System.out.println("SQLState : " + ex.getSQLState());
            System.out.println("CodeErreur : " + ex.getErrorCode());
        }
    }
    
    public ArrayList<Calendar> getLesDates() throws SQLException{
        
        ArrayList <Calendar> lesDates = new ArrayList();
        PompierMYSQL unPompierMysql = new PompierMYSQL();
        PreparedStatement prepStmt = null;
        String sql = "SELECT dteJour FROM feuilleGarde WHERE WEEK(dteJour) = ?";
        prepStmt = laConnection.prepareStatement(sql);
        prepStmt.setInt(1,TrmtDate.getDateDuJour().getWeeksInWeekYear());
        ResultSet resultat = prepStmt.executeQuery();
        while(resultat.next()){
            lesDates.add(TrmtDate.getCalDate(resultat.getDate("dteJour")));
        }
        return lesDates;
        }

    }
