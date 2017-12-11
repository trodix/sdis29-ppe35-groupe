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
    
    public ArrayList getLesGardes(int nCaserne){
        
        ArrayList <Gardes> lesGardes = new ArrayList();
        //ArrayList <Pompier> lesPompiers = new ArrayList();
        //for(Pompier unPompier : lesPompiers){
        PreparedStatement stmt = null;
        String sql = "select * from ventilation inner join salarie on salarie.id = ventilation.idSalarie where jourVentil between ? and ?";
        stmt = laConnection.prepareStatement(sql);
        stmt.setInt(1, nCaserne);
        
        
        for(Calendar uneDate : lesDates){
            for(String unePeriode : lesPeriodes){
                Gardes uneVentil = new Gardes(uneDate, unePeriode, unPompier, 0);
                lesVentil.add(uneVentil);
            }
        }
    }
}
