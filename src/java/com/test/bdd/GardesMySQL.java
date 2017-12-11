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
        String sql = "SELECT idCis, idPompier, dteJour, horaires.idHoraires, horaires.libelle, disponibilite.libelle FROM feuillegarde " +
                       "INNER JOIN pompier ON pompier.pCis = idCis AND pompier.pId = idPompier " +
                        "INNER JOIN horaires ON horaires.idHoraires = feuillegarde.idHoraires " +
                        "INNER JOIN disponibilite ON disponibilite.idDisponibilite = feuillegarde.idDispo " +
                        "WHERE idCis = ?" +
                        " ORDER BY idCis,idPompier,dteJour,feuillegarde.idHoraires";
        prepStmt = laConnection.prepareStatement(sql);
        prepStmt.setInt(1, nCaserne);
        ResultSet resultat = prepStmt.executeQuery();
        while(resultat.next()){
            Pompier unPompier = unPompierMysql.read(resultat.getInt("idCis"), resultat.getInt("idPompier"));
            Gardes uneGarde = new Gardes(TrmtDate.getCalDate(resultat.getDate("dteJour")), resultat.getInt("idHoraires"), unPompier, nCaserne);
            lesGardes.add(uneGarde);
        }
        return lesGardes;
        }

    }
