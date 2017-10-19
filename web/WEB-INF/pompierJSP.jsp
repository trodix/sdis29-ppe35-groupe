<%-- 
    Document   : pompierJSP
    Created on : 17 oct. 2017, 11:44:29
    Author     : fabien.ladouce
--%>

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
        <title>Page Pompier Volontaire</title>
    </head>
    <%
        Pompier unPompier = null;
        HttpSession maSession = request.getSession();
        if(maSession.getAttribute("unPompier") != null){
            unPompier = (Pompier)maSession.getAttribute("unPompier");
        }
        if(maSession.getAttribute("pompier") != null){
            System.out.println(maSession.getAttribute("pompier"));
        }
    %>
    <body class="fond-pompier">
        <div class="container">
            <div class="row">
                <div>
                    <div class="col-md-push-4 col-md-8">
                        <h1 class="text-right titre-profil marge-titre-profil">
                            <% 
                                out.println("Caserne " + unPompier.getcNom() + " : " + unPompier.getpNom() + " " + unPompier.getpPrenom()); 
                            %>
                        </h1>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="navbar.jspf" %>
        <div class="container">
                <form action="" method="POST">
                    <div class="table-responsive">
                        <table class="table tableau-infos-pompier" border="0">
                            <tbody>
                                <tr>
                                    <td><label for="nom" >Nom : </label></td>
                                    <td><input type="text" name="ztNom" id="nom" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpNom()); %>/><a href="Pompier"><i  <%maSession.setAttribute("id",1); %> class="fa fa-pencil couleur-icones" aria-hidden="true"></i></a></td>
                                    <td><label for="adresseMail" >Adresse Mail : </label></td>
                                    <td><input type="email" name="emailAdresse" id="adresseMail" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpMail()); %>/><a href="Pompier"><i <%maSession.setAttribute("id",1); %> class="fa fa-pencil couleur-icones" aria-hidden="true"></i></a></td>
                                </tr>
                                <tr>
                                    <td><label for="prenom" >Prénom : </label></td>
                                    <td><input type="text" name="ztPrenom" id="prenom" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpPrenom()); %>/><a href="Pompier"><i <%maSession.setAttribute("id",1); %> class="fa fa-pencil couleur-icones" aria-hidden="true"></i></a></td>
                                    <td><label for="caserneAppartenance" >Caserne : </label></td>
                                    <td><input name="caserneAppartenance" id="caserneAppartenance" class="taille-case-pompierVolontaire" disabled="disabled" value=<% out.println(unPompier.getcNom()); %>></td>
                                </tr>
                                <tr>
                                    <td><label for="adresse" >Adresse : </label></td>
                                    <td><input type="text" name="ztAdresse" id="adresse" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpAdresse()); %>/><a href="Pompier"><i  <%maSession.setAttribute("id",1); %> class="fa fa-pencil couleur-icones" aria-hidden="true"></i></a></td>
                                    <td><label for="statut" >Statut : </label></td>
                                    <td><input name="statut" id="statut" class="taille-case-pompierVolontaire" disabled="disabled" value=<% out.println(unPompier.getpStatut()); %>></td>
                                </tr>
                                <tr>
                                    <td><label for="ville" >Ville : </label></td>
                                    <td><input type="text" name="ztVille" id="ville" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpVille()); %>/><a href="Pompier"><i <%maSession.setAttribute("id",1); %> class="fa fa-pencil couleur-icones" aria-hidden="true"></i></a></td>
                                    <td><label for="grade" >Grade : </label></td>
                                    <td><input name="grade" id="grade" class="taille-case-pompierVolontaire" disabled="disabled" value=<% out.println(unPompier.getpGrade()); %>></td>
                                </tr>
                                <tr>
                                   <td><label for="cp" >Code Postal : </label></td>
                                   <td><input type="text" name="ztCP" id="cp" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpCp()); %>/><a href="Pompier"><i <%maSession.setAttribute("id",1); %> class="fa fa-pencil couleur-icones" aria-hidden="true"></i></a></td>
                                   <td><label for="noBip" >Numéro Bip : </label></td>
                                   <td><input type="text" name="noBip" id="noBip" class="taille-case-pompierVolontaire" disabled="disabled" value=<% out.println(unPompier.getpBip()); %>/></td>
                                </tr>
                            </tbody>
                    </table>              
                </div>
                <div class="row">
                    <div class="table-responsive col-md-6">
                        <table class="table">
                            <thead>
                                <h3 class="titre-profil">Informations Employeur</h3>                            
                            </thead>
                            <tbody>
                                <tr>
                                    <td><label for="denomination" >Dénomination sociale : </label></td>
                                    <td><input type="text" name="ztDenomination" id="denomination" class="taille-case-pompierVolontaire" disabled="disabled" value=<% out.println(unPompier.getEmpRaisonSoc()); %>/></td>
                                </tr>
                                <tr>
                                    <td><label for="adresseEmployeur" >Adresse : </label></td>
                                    <td><input type="text" name="ztAdresseEmployeur" id="adresseEmployeur" class="taille-case-pompierVolontaire" disabled="disabled" value=<% out.println(unPompier.getEmpAdresse()); %>/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <div><img src="images/test.jpg" class="img-responsive img-rounded" width="150" height="150"></div>
                    </div>
                </div>
                <div>
                    <h3 class="titre-profil">Commentaires : </h3>
                    <textarea name="ztCom" class="taille-case-commentaire"></textarea>
                </div>
                <div>
                    <label for="btModification"></label>
                    <input class="btn btn-lg bouton-validation" type="button submit" value="Valider modifications" id="btModifications"/>
                </div><br>
            </form>
        </div>
        
        <!--<%
            AuthentifForm leControle = (AuthentifForm) request.getAttribute("controleForm");
            if(leControle != null){
                out.println(leControle.getResultat());
            }
        %>-->
    </body>
</html>
