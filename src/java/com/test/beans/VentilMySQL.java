package com.test.beans;

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
public class VentilMySQL {
    
    private final Connection laConnection  = Connexion.getConnect("Localhost", 
                                                                "sdis29", 
                                                                "adminBDsdis", 
                                                                "mdpBDsdis");
    
    public ArrayList getLesGardes(int nCaserne){
        ArrayList <Gardes> lesGardes = new ArrayList();
        ArrayList <Pompier> lesPompiers = 
        for(Pompier unPompier : lesPompiers){
            for(Calendar uneDate : lesDates){
                for(String unePeriode : lesPeriodes){
                    Gardes uneVentil = new Gardes(uneDate, unePeriode, unPompier, 0);
                    lesVentil.add(uneVentil);
                }
            }
        }
        
        try {
            PreparedStatement stmt = null;
            Date dateDebut = TrmtDate.getSQLDate(lesDates[0]);
            Date dateFin = TrmtDate.getSQLDate(lesDates[lesDates.length - 1]);
            String sql = "select * from ventilation inner join salarie on salarie.id = ventilation.idSalarie where jourVentil between ? and ?";
            stmt = laConnection.prepareStatement(sql);
            stmt.setDate(1, dateDebut);
            stmt.setDate(2, dateFin);
            ResultSet resultat = stmt.executeQuery();
            while(resultat.next()) {
                Pompier unPompier = new Pompier(resultat.getInt("cId"), resultat.getInt("pId"), resultat.getString("pNom"), resultat.getString("pPrenom"), resultat.getString("pAdresse"), resultat.getString("pVille"), resultat.getString("pCp"), resultat.getString("pMail"), resultat.getString("pBip"), resultat.getString("pStatut"), resultat.getString("pGrade"), resultat.getInt("iGrade"), resultat.getString("pUrlPhoto"), resultat.getString("pCommentaire"), resultat.getString("cNom"), resultat.getString("EmpRaisonSoc"), resultat.getString("EmpAdresse"));
                Gardes uneVentil = new Gardes(TrmtDate.getCalDate(resultat.getDate("jourVentil")), resultat.getString("periode"), unPompier, 0);
                int index = lesVentil.indexOf(uneVentil);
                if(index >= 0){
                    uneVentil = lesVentil.get(index);
                    uneVentil.setActivite(resultat.getInt("ventil"));
                    uneVentil.setIsInBdd(true);
                }
            }
            stmt.close(); 
            resultat.close();
        } catch(SQLException ex){
            System.out.println("SQLExecption : " + ex.getMessage());
            System.out.println("SQLState : " + ex.getSQLState());
            System.out.println("CodeErreur : " + ex.getErrorCode());
        }  
        
        return lesVentil;
    }

    public void delete(Gardes uneVentil){
        int idSalarie = uneVentil.getPompier().getpId();
        try {
            PreparedStatement stmt = null;
            String sql = "DELETE FROM ventilation WHERE idSalarie = ?";
            stmt = laConnection.prepareStatement(sql);
            stmt.setInt(1, idSalarie);
            stmt.executeUpdate();
            stmt.close();
        } catch(SQLException ex){
            System.out.println("SQLExecption : " + ex.getMessage());
            System.out.println("SQLState : " + ex.getSQLState());
            System.out.println("CodeErreur : " + ex.getErrorCode());
        }  
    }
    
    public void update(Gardes uneVentil, int activite){
        int idSalarie = uneVentil.getPompier().getpId();
        Date jourVentil = TrmtDate.getSQLDate(uneVentil.getJourVentil());
        try {
            PreparedStatement stmt = null;
            String sql = "UPDATE ventilation SET ventil = ? WHERE idSalarie = ? AND jourVentil = ? AND periode = ?";
            stmt = laConnection.prepareStatement(sql);
            stmt.setInt(1, activite);
            stmt.setInt(2, idSalarie);
            stmt.setDate(3, jourVentil);
            stmt.setString(4, uneVentil.getPeriode());
            stmt.executeUpdate();
            stmt.close();
        } catch(SQLException ex){
            System.out.println("SQLExecption : " + ex.getMessage());
            System.out.println("SQLState : " + ex.getSQLState());
            System.out.println("CodeErreur : " + ex.getErrorCode());
        }
    }
    
    public void create(Gardes uneVentil, int activite){
        int idSalarie = uneVentil.getPompier().getpId();
        Date jourVentil = TrmtDate.getSQLDate(uneVentil.getJourVentil());
        try {
            PreparedStatement stmt = null;
            String sql = "INSERT INTO ventilation(jourVentil, periode, idSalarie, ventil) values(?, ?, ?, ?)";
            stmt = laConnection.prepareStatement(sql);
            stmt.setDate(1, jourVentil);
            stmt.setString(2, uneVentil.getPeriode());
            stmt.setInt(3, idSalarie);
            stmt.setInt(4, activite);
            stmt.executeUpdate();
            stmt.close();
        } catch(SQLException ex){
            System.out.println("SQLExecption : " + ex.getMessage());
            System.out.println("SQLState : " + ex.getSQLState());
            System.out.println("CodeErreur : " + ex.getErrorCode());
        }
    }
}
