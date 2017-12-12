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
            String[] lesCouleurs = {"vert", "orange", "rouge"};
            String[] horaire = {"Nuit","Mat","ApMi","Soir"};
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
		<div class="table-responsive">
		<table  class="table table-bordered">
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
                                        out.println("<th>Nuit</th><th>Mat.</th><th>ApMi</th><th>Soir</th>");
                                    }  
                                %>
						
                            </tr>
                        </thead>
			<tbody class="charte">
                        <form action="jesaispas" method="POST">
				<tr>
                                    <%
                                        idPompier = 0;
                                        int garde = 0;
                                        String zoneInput = "<input type='number' min=0 max=2 readonly='readonly'"+
                                                            "class='inputDispo ztGarde " + lesCouleurs[garde] + "' name='tabVentil'"+
                                                            "value=" + garde + " />";
                                        for (Gardes uneGarde : lesGardes) { 

                                            if(idPompier != uneGarde.getPompier().getpId()){
                                                idPompier = uneGarde.getPompier().getpId();
                                                out.println("<td>"+uneGarde.getPompier().getpNom()+" "+uneGarde.getPompier().getpPrenom()+"</td>");
                                                out.println("<td>"+uneGarde.getPompier().getpBip()+"</td>");
                                                //if(uneGarde.getIsInInBdd() == false){
                                                //   garde = 0;
                                                //}else{
                                                    garde = uneGarde.getActivite();
                                                //}
                                                
                                                out.println("<td class='noir'>"+zoneInput+"</td>");
                                            }else{
                                                //if(uneGarde.getIsInInBdd() == false){
                                                 //   garde = 0;
                                                //}else{
                                                    garde = uneGarde.getActivite();
                                                //}

                                                out.println("<td class='noir'>"+zoneInput+"</td>");
                                        }
                                        
                                        }
                                    %>
				</tr>
                            </form>
                        </tbody>
			</table>
		</div>
        </div>
		<script src="js/jquery.min.js"> </script>
		<script>
			var couleur = ["verte","orange","rouge"];
			// Gestion des evenements
			$(document).ready(function() {
				$(".ztGarde").mouseover(function() {
				$(this).addClass("survol");
				});

				$(".ztGarde").mouseout(function() {
					$(this).removeClass("survol");
				});

				$(".ztGarde").click(function() {
					v = $(this).val(); // Ancienne valeur
					nv = (v+1) % 3; // Nouvelle Valeur
					$(this).addClass(couleur[nv]);
					$(this).removeClass(couleur[v]);
					$(this).val(nv);
					});
				});
		</script>
        </div>     
    </body>
       
