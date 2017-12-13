/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.form;

import com.test.bdd.GardesMySQL;
import com.test.beans.Gardes;
import com.test.beans.Pompier;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 *
 * @author fabien.ladouce
 */
public class GardesForm {
    
    public void verifGardes(HttpServletRequest request){
        
        
        HttpSession maSession = request.getSession();
        ArrayList <Gardes> lesGardes = (ArrayList<Gardes>)maSession.getAttribute("lesGardes");
        Map<String, String[]> map = request.getParameterMap();
        System.out.println(map.toString());
        String[]lesNvGardes = map.get("tabGardes");
        
        int activite = 0;
        int i = 0;
        GardesMySQL uneGardeMysql = new GardesMySQL();
        for(Gardes uneGardes : lesGardes){
            activite = Integer.parseInt(lesNvGardes[i]);
            if(activite !=  uneGardes.getActivite()){
                if(uneGardes.getIsInInBdd()){
                    if(activite == 0){
                        uneGardeMysql.delete(uneGardes);
                    }else{
                        uneGardeMysql.update(uneGardes, activite);
                    }
                }else{
                    uneGardeMysql.create(uneGardes, activite);
                }
            }
            
            i ++;
        }
    }
}
