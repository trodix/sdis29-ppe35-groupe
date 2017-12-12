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
