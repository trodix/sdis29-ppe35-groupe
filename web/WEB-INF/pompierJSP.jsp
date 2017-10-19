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
        int nCaserne = 0;
        int pId = 0;
        boolean pompier = false;
        boolean chefDeCentre = false;
        boolean responsableDesAlertes = false;
        
        HttpSession maSession = request.getSession();
        if(maSession.getAttribute("nCaserne") != null){
            nCaserne = (int)maSession.getAttribute("nCaserne");        
        }
        if(maSession.getAttribute("pId") != null){
            pId = (int)maSession.getAttribute("pId");
        }
        PompierMYSQL unPompierMYSQL = new PompierMYSQL();
        
        Pompier unPompier = unPompierMYSQL.read(nCaserne, pId);
        int responsable = unPompierMYSQL.getIsResponsable();
        System.out.print("test eee" + responsable);
        switch(responsable){
            case 1:
                pompier = true;
                break;
            case 2:
                chefDeCentre = true;
                break;
            case 3:
                responsableDesAlertes = true;
                break;
        }
        //if(isResponsable.equals("chef de centre")){
        //    System.out.println("test");
        //}else {
        //    if(isResponsable.equals("pompier")){
        //        System.out.print("test2");
        //    }else{
        //        if(isResponsable.equals("responsable des alertes")){
        //           System.out.println("test3");
                //}
            //}
        //}
        
    %>
    <body class="fond-pompier">
        <div class="container">
            <div class="row">
                <div>
                    <div class="col-md-push-3 col-md-4">
                        <h1 class="text-right titre-profil">
                            <% 
                                out.println("Caserne " + unPompier.getcNom() + " : " + unPompier.getpNom() + " " + unPompier.getpPrenom()); 
                            %>
                        </h1>
                    </div>
                    <div class="col-md-push-7 col-md-4">
                         <div><img src="images/test.jpg" class="img-responsive img-rounded" width="150" height="150"></div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="navbar.jspf" %>
        <div class="container">
                <form action="" method="POST">
                    <div class="tbale-responsive">
                        <table class="table tableau-infos-pompier">
                            <tbody>
                                <tr>
                                    <td><label for="nom" >Nom : </label></td>
                                    <td><input type="text" name="ztNom" id="nom" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpNom()); %>/></td>
                                    <td><i class="fa fa-pencil couleur-icones" aria-hidden="true"></i></td>
                                    <td><label for="adresseMail" >Adresse Mail : </label></td>
                                    <td><input type="email" name="emailAdresse" id="adresseMail" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpMail()); %>/></td>
                                    <td><i class="fa fa-pencil couleur-icones" aria-hidden="true"></i></td>
                                </tr>
                                <tr>
                                    <td><label for="prenom" >Prénom : </label></td>
                                    <td><input type="text" name="ztPrenom" id="prenom" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpPrenom()); %>/></td>
                                    <td><i class="fa fa-pencil couleur-icones" aria-hidden="true"></i></td>
                                    <td><label for="caserneAppartenance" >Caserne : </label></td>
                                    <td><input name="caserneAppartenance" id="caserneAppartenance" class="taille-case-pompierVolontaire" disabled="disabled" value=<% out.println(unPompier.getcNom()); %>></td>
                                </tr>
                                <tr>
                                    <td><label for="adresse" >Adresse : </label></td>
                                    <td><input type="text" name="ztAdresse" id="adresse" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpAdresse()); %>/></td>
                                    <td><i class="fa fa-pencil couleur-icones" aria-hidden="true"></i></td>
                                    <td><label for="statut" >Statut : </label></td>
                                    <td><input name="statut" id="statut" class="taille-case-pompierVolontaire" disabled="disabled" value=<% out.println(unPompier.getpStatut()); %>></td>
                                </tr>
                                <tr>
                                    <td><label for="ville" >Ville : </label></td>
                                    <td><input type="text" name="ztVille" id="ville" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpVille()); %>/></td>
                                    <td><i class="fa fa-pencil couleur-icones" aria-hidden="true"></i></td>
                                    <td><label for="grade" >Grade : </label></td>
                                    <td><input name="grade" id="grade" class="taille-case-pompierVolontaire" disabled="disabled" value=<% out.println(unPompier.getpGrade()); %>></td>
                                </tr>
                                <tr>
                                   <td><label for="cp" >Code Postal : </label></td>
                                   <td><input type="text" name="ztCP" id="cp" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpCp()); %>/></td>
                                   <td><i class="fa fa-pencil couleur-icones" aria-hidden="true"></i></td>
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
                </div>
                <div>
                    <p>Commentaires : </p>
                    <textarea class="taille-case-commentaire"></textarea>
                </div>
                <div class="bouton-validation">
                    <label for="btModification"></label>
                    <input class="btn btn-lg" type="button submit" value="Valider modifications" id="btModifications"/>
                </div><br>
            </form>
        
        <!--<%
            AuthentifForm leControle = (AuthentifForm) request.getAttribute("controleForm");
            if(leControle != null){
                out.println(leControle.getResultat());
            }
        %>-->
    </body>
</html>
