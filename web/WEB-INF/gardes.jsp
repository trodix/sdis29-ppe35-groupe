<%-- 
    Document   : gardes
    Created on : 11 déc. 2017, 16:26:28
    Author     : sebastien.vallet
--%>

<%@page import="com.personnelTP.util.TrmtDate"%>
<%@page import="com.personnelTP.util.TrmtDate"%>
<%@page import="com.test.beans.Gardes"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.Pompier"%>
<%@page import="com.test.bdd.PompierMYSQL"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.test.form.AuthentifForm"%>
<%@page import="com.test.form.AuthentifForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" title="Bootstrap" href="css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" title="Font Awesome" href="css/font-awesome.css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Liste des gardes</title>
    </head>
        <%@include file="navbar.jspf"%>
        <% 
            String[] lesCouleurs = {"rouge", "orange", "vert", "bleu"};
            ArrayList <Gardes> lesGardes = (ArrayList)maSession.getAttribute("lesGardes");
            ArrayList <Calendar> lesDates = new ArrayList();
            ArrayList <String> lesHoraires = (ArrayList)maSession.getAttribute("lesHoraires");
           
            for(int i = 0; i<7; i++){
                Calendar c = TrmtDate.addDays(TrmtDate.getDateDebutSemaine(), i);
                lesDates.add(c);
            }
            int idPompier = 0;
           
            /**Calendar[] dates = (Calendar[])maSession.getAttribute("dates");
            String[] periodes = (String[])maSession.getAttribute("periodes");**/
        %>
        <div class="container">
            <form action="gardes" method="POST">
            <h1 class="charte">Liste des gardes</h1>
            <div class="table-responsive table-gardes div-size">
                <div class="row">
                    <div class="col-xs-2">
                        <div class="legende-inter"><img src="images/legende-0.png"><h5>Indisponible</h5></div>
                    </div>
                    <div class="col-xs-2">
                        <div class="legende-inter"><img src="images/legende-1.png"><h5>Travail</h5></div>
                    </div>
                    <div class="col-xs-2">
                        <div class="legende-inter"><img src="images/legende-2.png"><h5>Disponible</h5></div>
                    </div>
                    <div class="col-xs-2">
                        <div class="legende-inter"><img src="images/legende-3.png"><h5>Garde</h5></div>
                    </div>
                </div>
                <div class="row">
                    <div>Tranches horaires</div>
                    <%

                        for(String unHoraire : lesHoraires){
                            out.println("<div class='col-xs-3 legende bold'>" + (lesHoraires.indexOf(unHoraire) + 1) + " - " + unHoraire + "</div>");
                        }
                    %>
                </div>
                <table  class="table table-bordered table-collapse">
                        <thead class="charte">
                            <tr class="enteteTableau">
                                <th rowspan="2">Volontaire</th>
                                <th rowspan="2">N° Bip</th>
                                <%

                                    for(Calendar uneDate : lesDates){
                                        out.println("<th colspan='4'>"+TrmtDate.getDateAAfficher(uneDate)+"</th>");
                                    }
                                %>
                            </tr>
                            <tr>
                                <%
                                    for (Calendar uneDate : lesDates) { 
                                        out.println("<th>1</th><th>2</th><th>3</th><th>4</th>");
                                    }  
                                %>

                            </tr>
                        </thead>
                        
			<tbody class="charte">
                        
				<tr>
                                    <%
                                        idPompier = 0;
                                        int garde = 0;
                                        String zoneInput = "<input type='number' min=0 max=3 readonly='readonly' "+
                                                            "class='inputDispo ztGarde " + lesCouleurs[garde] + "' name='tabGardes'"+
                                                            "value=" + garde + " />";
                                        
                                        for (Gardes uneGarde : lesGardes) { 
                                            System.out.println(idPompier);
                                            if(idPompier != uneGarde.getPompier().getpId()){
                                                idPompier = uneGarde.getPompier().getpId();
                                                out.println("</tr><tr><td>"+uneGarde.getPompier().getpNom()+" "+uneGarde.getPompier().getpPrenom()+"</td>");
                                                out.println("<td>"+uneGarde.getPompier().getpBip()+"</td>");
                                                //if(uneGarde.getIsInInBdd() == false){
                                                //   garde = 0;
                                                //}else{
                                                    garde = uneGarde.getActivite();
                                                //}
                                                zoneInput = "<input type='number' min=0 max=3 readonly='readonly' "+
                                                            "class='inputDispo ztGarde " + lesCouleurs[garde] + "' name='tabGardes' " + "id='" + uneGarde.getPompier().getcId() + uneGarde.getPompier().getpId() + "' " +
                                                            "value=" + garde + " />";
                                                out.println("<td class='noir'>"+zoneInput+"</td>");
                                            }else{
                                                //if(uneGarde.getIsInInBdd() == false){
                                                 //   garde = 0;
                                                //}else{
                                                    garde = uneGarde.getActivite();
                                                //}
                                                zoneInput = "<input type='number' min=0 max=3 readonly='readonly' "+
                                                            "class='inputDispo ztGarde " + lesCouleurs[garde] + "' name='tabGardes' " + "id='" + uneGarde.getPompier().getcId() + uneGarde.getPompier().getpId() + "'  " +
                                                            "value=" + garde + " />";
                                                out.println("<td class='noir'>"+zoneInput+"</td>");
                                            }
                                        
                                        }
                                    %>
				</tr>
                        </tbody>
                </table>             
            </div>
                <input type="submit" class="btn btn-lg bouton-validation" value="Valider les modifications"/>
            </form>
        </div>
		<script src="js/jquery.min.js"> </script>
		<script>
                        
                        //*******************************
                        var pompierStatut = '<% out.print(String.valueOf(unPompier.getpStatut())); %>';
                        pompierStatut == '2' ? couleur = ["rouge", "bleu"] : couleur = ["rouge", "orange", "vert"];
                        //alert(pompierStatut + ' ' + typeof(pompierStatut));
                        // Gestion des evenements
                        $(document).ready(function() {
                            
                            $(".ztGarde").mouseover(function() {
                                $(this).addClass("survol");
                            });

                            $(".ztGarde").mouseout(function() {
                                $(this).removeClass("survol");
                            });
                            
                            $(".ztGarde").click(function() {
                                var pompierId = '<% out.print(String.valueOf(unPompier.getcId()) + String.valueOf(unPompier.getpId())); %>';
                                
                                if(($('.ztGarde').attr('id') == pompierId) || (pompierStatut == '2')){
                                    
                                    v = parseInt($(this).val());
                                    pompierStatut == '2' ? nv = ((v+1)%2)*3 : nv = (v+1) % 3;

                                    if(pompierStatut != '2'){
                                        
                                        if(v != '3'){
                                            
                                            $(this).addClass(couleur[nv]);    
                                            $(this).removeClass(couleur[v]);
                                            $(this).val(nv);
                                        }
                                    }else{
                                        
                                        switch(v){
                                            /**case v == '0':
                                                $(this).addClass(couleur[0]);
                                                $(this).removeClass(couleur[1]);
                                                break;**/
                                                
                                            case 1:
                                                $(this).addClass(couleur[1]);
                                                $(this).removeClass(couleur[0]);
                                                $(this).val('3');
                                                break;
                                            
                                            case 2:
                                                $(this).addClass(couleur[1]);
                                                $(this).removeClass(couleur[0]);
                                                $(this).val('3');
                                                break;
                                                
                                            case 3:
                                                $(this).addClass(couleur[0]);
                                                $(this).removeClass(couleur[1]);
                                                $(this).val('0');
                                                break;
                                        }
                                        
                                    }
                                }
                            });
                        });

		</script>
        </div>     
    </body>
       
