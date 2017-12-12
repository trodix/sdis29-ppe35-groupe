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
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;

/**
 *
 * @author aurelien.thazet
 */
public class GardesMySQL {
    private final Connection laConnection  = Connexion.getConnect("Localhost", 
                                                                "sdis29", 
                                                                "adminBDsdis", 
                                                                "mdpBDsdis");
    
    public ArrayList getLesGardes(int nCaserne) throws SQLException{
        
        ArrayList <Gardes> lesGardes = new ArrayList();
        PompierMYSQL unPompierMysql = new PompierMYSQL();
        //ArrayList <Pompier> lesPompiers = new ArrayList();
        //for(Pompier unPompier : lesPompiers){
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
        while(resultat.next()){
            Pompier unPompier = unPompierMysql.read(resultat.getInt("idCis"), resultat.getInt("idPompier"));
            Calendar c = TrmtDate.getCalDate(resultat.getDate("dteJour"));
            Gardes uneGarde = new Gardes(c, resultat.getInt("idHoraires"), unPompier, resultat.getInt("idDispo"));
            
            lesGardes.add(uneGarde);
        }

        
        return lesGardes;
        }
    
    public ArrayList<Calendar> getLesDates() throws SQLException{
        
        ArrayList <Calendar> lesDates = new ArrayList();
        PompierMYSQL unPompierMysql = new PompierMYSQL();
        PreparedStatement prepStmt = null;
        String sql = "SELECT dteJour FROM feuilleGarde WHERE WEEK(dteJour) = ?";
        prepStmt = laConnection.prepareStatement(sql);
        System.out.println("Semaine : "+TrmtDate.getDateDuJour().getWeekYear());
        prepStmt.setInt(1,TrmtDate.getDateDuJour().getWeeksInWeekYear());
        ResultSet resultat = prepStmt.executeQuery();
        while(resultat.next()){
            lesDates.add(TrmtDate.getCalDate(resultat.getDate("dteJour")));
        }
        return lesDates;
        }

    }
