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
                    <div class="col-md-4">
                        <div class="marge-logo"><img src="images/logo-sdis.png"></div>
                    </div>
                    <div class="col-md-4">
                        <h1 class="text-left">
                            <% 
                                out.println("Caserne : " + unPompier.getcNom() + " " + unPompier.getpNom() + " " + unPompier.getpPrenom()); 
                            %>
                        </h1>
                    </div>
                    <div class="col-md-4">
                         <div><img src="images/test.jpg" class="img-responsive img-rounded" width="150" height="150"></div>
                    </div>
                </div>
            </div>
                <form action="" method="POST">
                    <div class="row">
                        <div>
                            <p>Votre profil</p>
                        </div>
                        <div class="col-md-2">
                            <div>
                                <label for="nom" >Nom : </label>
                            </div><br>
                            <div>
                                <label for="prenom" >Prénom : </label>
                            </div><br>
                            <div>
                                <label for="adresse" >Adresse : </label>
                            </div><br>
                            <div>
                                <label for="ville" >Ville : </label>
                            </div><br>
                            <div>
                                <label for="cp" >Code Postal : </label>
                            </div><br>
                        </div>
                        <div class="col-md-3">
                            <div>
                                <input type="text" name="ztNom" id="nom" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpNom()); %>/>
                            </div><br>
                            <div>
                                <input type="text" name="ztPrenom" id="prenom" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpPrenom()); %>/>
                            </div><br>
                            <div>
                                <input type="text" name="ztAdresse" id="adresse" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpAdresse()); %>/>
                            </div><br>
                            <div>
                                <input type="text" name="ztVille" id="ville" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpVille()); %>/>
                            </div><br>
                            <div>
                                <input type="text" name="ztCP" id="cp" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpCp()); %>/>
                            </div><br>
                        </div>
                        <div class="col-md-1">
                            <div>
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                            </div><br>
                            <div>
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                            </div><br>
                            <div>
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                            </div><br>
                            <div>
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                            </div><br>
                            <div>
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                            </div><br>
                        </div>
                        <div class="col-md-2">
                            <div>
                                <label for="adresseMail" >Adresse Mail : </label>
                            </div><br>
                            <div>
                                <label for="caserneAppartenance" >Caserne : </label>
                            </div><br>
                            <div>
                                <label for="statut" >Statut : </label>
                            </div><br>
                            <div>
                                <label for="grade" >Grade : </label>
                            </div><br>
                            <div>
                                <label for="noBip" >Numéro Bip : </label>
                            </div><br>
                        </div>
                        <div class="col-md-3">
                            <div>
                                <input type="email" name="emailAdresse" id="adresseMail" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpMail()); %>/>
                            </div><br>
                            <div>
                                <input name="caserneAppartenance" id="caserneAppartenance" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getcNom()); %>>
                            </div><br>
                            <div>
                                <input name="statut" id="statut" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpStatut()); %>>
                            </div><br>
                            <div>
                                <input name="grade" id="grade" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpGrade()); %>>
                            </div><br>
                            <div>
                                <input type="text" name="noBip" id="noBip" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getpBip()); %>/>
                            </div><br>
                        </div>
                        <div class="col-md-1">
                            <div>
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                            </div><br>
                        </div><br>
                    </div>
                    <div class="row">
                        <p>Informations Employeur</p>
                        <div class="col-md-2">
                            <div>
                                <label for="denomination" >Dénomination sociale : </label>
                            </div><br>
                            <div>
                                <label for="adresseEmployeur" >Adresse : </label>
                            </div><br>
                        </div><br>
                        <div class="col-md-2">
                            <div>
                                <input type="text" name="ztDenomination" id="denomination" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getEmpRaisonSoc()); %>/>
                            </div><br>
                            <div>
                                <input type="text" name="ztAdresseEmployeur" id="adresseEmployeur" class="taille-case-pompierVolontaire" value=<% out.println(unPompier.getEmpAdresse()); %>/>
                            </div><br>
                        </div><br>
                    </div>
                    <div>
                        <p>Commentaires : </p>
                        <textarea></textarea>
                    </div>
                    <div>
                        <label for="btModification"></label>
                        <input type="submit" value="Valider modifications" id="btModifications"/>
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
