<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.Pompier"%>
<%@page import="com.test.bdd.PompierMYSQL"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.test.form.AuthentifForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" title="Bootstrap" href="css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" title="Font Awesome" href="css/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/accesProduits.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Gestion des Alertes</title>
    </head>
        
        <%@include file="navbar.jspf" %>
        <%  String typeModif = "";
        if(request.getParameter("readonly")!= null){
            if(request.getParameter("readonly").equals("false")){
                typeModif = "";
            } else {
                typeModif = "disabled='disabled'";
            }
        }
        if(request.getParameter("idCaserne") != null && request.getParameter("idPompier") != null){
            PompierMYSQL unPompierMYSQL = new PompierMYSQL();
                unPompier = unPompierMYSQL.read(Integer.parseInt(request.getParameter("idCaserne")),Integer.parseInt(request.getParameter("idPompier")));
                maSession.setAttribute("unPompier",unPompier);
            
        }else{
            
            AuthentifForm leControle = new AuthentifForm();
            leControle = (AuthentifForm)maSession.getAttribute("controleForm");
            PompierMYSQL unPompierMYSQL = new PompierMYSQL();
            if(leControle != null){
                unPompier = unPompierMYSQL.read(leControle.getnCaserne(), leControle.getpId());
                maSession.setAttribute("unPompier",unPompier);
            }
        }
            
        %>
        <div class="container pageAlertes">
            <form action="Pompier" method="POST">
                <div>
                    
                    <div class="row">
                        <table class="table tableau-infos-pompier legende" border="0">
                                <h2 class="titre-legende">Lieu Incident</h2>
                                <tr>
                                    <td><label for="adresse" >Libelle : </label></td>
                                    <td><input type="text" name="ztLibelle" id="libelle" class="alertesCase"/></td>
                                    <td><label for="adresse" >Adresse : </label></td>
                                    <td><input type="text" name="ztAdresse" id="adresse" class="alertesCase"/></td>
                                </tr>
                                <tr>
                                    <td><label for="ville" >Ville : </label></td>
                                    <td><input type="text" name="ztVille" id="ville" class="alertesCase"/></td>
                                    <td><label for="cp" >Code Postal : </label></td>
                                    <td><input type="text" name="ztCP" id="cp" class="alertesCase"/></td>
                                </tr>
                        </table> 
                    </div>
                    <div class="row margin-div">
                        <h3 class="titre-profil">Description :</h3>
                        <textarea name="ztDesc" class="taille-case-description"></textarea>
                    </div>
                    <div class="row">
                        <table class="table tableau-infos-pompier legende" border="0">
                            <h2 class="titre-legende">Gestion Incident</h2>
                            <tr>
                                <td><label for="casernes" >Casernes : </label>
                                
                                    <select name='casernes' class='alertesCase'>
                                    <%
                                        ArrayList <String> lesCasernes = (ArrayList)maSession.getAttribute("lesCasernes");
  
                                            for(int a = 0; a < lesCasernes.size()-1;a++){
                                                out.println("<option class='alertesCases' onclick='getPompiers(this.value);' id='"+lesCasernes.get(a)+"'>" + lesCasernes.get(a) + "</option>");
                                            }
                                    
                                    %>
                                    </select>
                                </td>
                            </tr>
                           
                        </table> 
                    </div>
                </div>
                <div class="row">
                    <table class="table tableau-infos-pompier" border="0">
                        <tr>
                            <td>
                                <label for="casernes" >Nombre de Pompiers :</label>                            
                                <select name="nbPompiers" size="1">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>
                            </td>
                            <td>
                                <label for="trancheHoraire" >Tranche Horaire :</label>
                                <select name="trancheHoraire" size="1" class='alertesListes'>
                                    <option>Nuit</option>
                                    <option>Matin</option>
                                    <option>Après-Midi</option>
                                    <option>Soir</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="row margin-div">
                    <table class="table tableau-infos-pompier" border="0">
                        <tr>
                            <td>
                                <label for="choixPompiers">Choix des Pompiers :</label>
                                <select name="choixPompiers" id="listePompiers" class='alertesListes'>

                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="row">
                    <table class="table tableau-liste-pompier table-bordered table-striped">
                        <thead>
                        <h2 class="titre-legende">Équipe d'Intervention :</h2>
                            <tr>
                                <th>Caserne</th>
                                <th>Pompier</th>
                            </tr>
                        </thead>
                        <tbody id="tableauPompier">
                            
                        </tbody>
                    </table>
                </div>
                <div class="row align-div">
                    <label for="btModification"></label>
                    <input class="btn btn-lg bouton-validation" type="submit" value="Lancer l'alerte" id="btModifications"/>
                </div><br>
            </form>
        </div>
    </body>
    <script>
        
       function ajouter(id, idCaserne, nom, prenom){
        
            $('#tableauPompier').append("<tr id='"+idCaserne +""+  id+"'><td>"+idCaserne+"</td><td>"+nom + " " + prenom+"("+id+")</td></tr>");
        }
        
    </script>
</html>
