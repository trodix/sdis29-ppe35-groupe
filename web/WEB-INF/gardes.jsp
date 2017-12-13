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
<link rel="stylesheet" type="text/css" title="Bootstrap" href="css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" title="Font Awesome" href="css/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des gardes</title>
    </head>
        <%@include file="navbar.jspf"%>
        <% 
            String[] lesCouleurs = {"vert", "orange", "rouge", "bleu"};
            ArrayList <Gardes> lesGardes = (ArrayList)maSession.getAttribute("lesGardes");
            ArrayList <Calendar> lesDates = new ArrayList();
           
            for(int i = 0; i<7; i++){
                Calendar c = TrmtDate.addDays(TrmtDate.getDateDebutSemaine(), i);
                lesDates.add(c);
            }
            int idPompier = 0;
           
            /**Calendar[] dates = (Calendar[])maSession.getAttribute("dates");
            String[] periodes = (String[])maSession.getAttribute("periodes");**/
        %>
        <div class="container">
            <h1 class="charte">Liste des gardes</h1>
            <div class="table-responsive table-gardes">
                <table class="titre-profil">
                    <thead>
                        <th><h3>Légende</h3></th> 
                    </thead>
                    <tbody>
                        <!-- Légende bouton 3 : zoomer page web a 230% -->
                        <tr><td><img src="images/legende-0.png"></td><td>Indisponible</td></tr>
                        <tr><td><img src="images/legende-1.png"></td><td>Disponible</td></tr>
                        <tr><td><img src="images/legende-2.png"></td><td>Au travail</td></tr>
                    </tbody>
                </table>
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
                                        String zoneInput = "<input type='number' min=0 max=3 readonly='readonly'"+
                                                            "class='inputDispo ztGarde " + lesCouleurs[garde] + "' name='tabVentil'"+
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
                                                zoneInput = "<input type='number' min=0 max=3 readonly='readonly'"+
                                                            "class='inputDispo ztGarde " + lesCouleurs[garde] + "' name='tabVentil' " + "id='" + uneGarde.getPompier().getcId() + uneGarde.getPompier().getpId() + "' " +
                                                            "value=" + garde + " />";
                                                out.println("<td class='noir'>"+zoneInput+"</td>");
                                            }else{
                                                //if(uneGarde.getIsInInBdd() == false){
                                                 //   garde = 0;
                                                //}else{
                                                    garde = uneGarde.getActivite();
                                                //}
                                                zoneInput = "<input type='number' min=0 max=3 readonly='readonly'"+
                                                            "class='inputDispo ztGarde " + lesCouleurs[garde] + "' name='tabVentil' " + "id='" + uneGarde.getPompier().getcId() + uneGarde.getPompier().getpId() + "'  " +
                                                            "value=" + garde + " />";
                                                out.println("<td class='noir'>"+zoneInput+"</td>");
                                            }
                                        
                                        }
                                    %>
				</tr>
                        </tbody>
                </table>             
            </div>
                <input type="submit" value="Valider les modifications"/>
            </form>
        </div>
		<script src="js/jquery.min.js"> </script>
		<script>
                        
                        //*******************************
                        var couleur = ["verte","orange","rouge","bleu"];  
                        // Gestion des evenements
                        $(document).ready(function() {
                            
                            $(".ztGarde").mouseover(function() {
                                $(this).addClass("survol");
                            });

                            $(".ztGarde").mouseout(function() {
                                $(this).removeClass("survol");
                            });
                            
                            $(".ztGarde").click(function() {
                                //if($(".ztGarde").attr("id").val() === unPompier.getcId() + unPompier.getpId();){
                                    v = $(this).val();
                                    nv = (v+1) % 3;

                                    $(this).addClass(couleur[nv]);    
                                    $(this).removeClass(couleur[v]);
                                    $(this).val(nv);
                                //}
                            });
                        });

		</script>
        </div>     
    </body>
       
