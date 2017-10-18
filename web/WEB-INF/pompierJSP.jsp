<%-- 
    Document   : pompierJSP
    Created on : 17 oct. 2017, 11:44:29
    Author     : fabien.ladouce
--%>

<%@page import="com.test.form.AuthentifForm"%>
<%@page import="com.test.form.AuthentifForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" title="Bootstrap" href="css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" title="Font Awesome" href="css/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Pompier Volontaire</title>
    </head>
    <body class="fond-pompier">
        <div class="container">
            <div class="row">
                <div>
                    <div class="col-md-4">
                        <div class="marge-logo"><img src="images/logo-sdis.png"></div>
                    </div>
                    <div class="col-md-4">
                        <h1 class="text-left"> Nom Prénom Pompier</h1>
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
                                <input type="text" name="ztNom" id="nom" class="taille-case-pompierVolontaire"/>
                            </div><br>
                            <div>
                                <input type="text" name="ztPrenom" id="prenom" class="taille-case-pompierVolontaire"/>
                            </div><br>
                            <div>
                                <input type="text" name="ztAdresse" id="adresse" class="taille-case-pompierVolontaire"/>
                            </div><br>
                            <div>
                                <input type="text" name="ztVille" id="ville" class="taille-case-pompierVolontaire"/>
                            </div><br>
                            <div>
                                <input type="text" name="ztCP" id="cp" class="taille-case-pompierVolontaire"/>
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
                                <input type="email" name="emailAdresse" id="adresseMail" class="taille-case-pompierVolontaire"/>
                            </div><br>
                            <div>
                                <select name="caserneAppartenance" id="caserneAppartenance" class="taille-case-pompierVolontaire">
                                    <option value="Benodet">Benodet</option>
                                    <option value="Bannalec">Bannalec</option>
                                    <option value="Brasparts">Brasparts</option>
                                </select>
                            </div><br>
                            <div>
                                <select name="statut" id="statut" class="taille-case-pompierVolontaire">
                                    <option value="Volontaire">Pompier Volontaire</option>
                                    <option value="Pro">Pompier Professionel</option>
                                    <option value="Medical">Personnel Médical</option>
                                </select>
                            </div><br>
                            <div>
                                <select name="grade" id="grade" class="taille-case-pompierVolontaire">
                                    <option value="Adjudant">Adjudant</option>
                                    <option value="AdjudantChef">Adjudant-Chef</option>
                                    <option value="Capitaine">Capitaine</option>
                                </select>
                            </div><br>
                            <div>
                                <input type="text" name="noBip" id="noBip" class="taille-case-pompierVolontaire"/>
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
                                <input type="text" name="ztDenomination" id="denomination" class="taille-case-pompierVolontaire"/>
                            </div><br>
                            <div>
                                <input type="text" name="ztAdresseEmployeur" id="adresseEmployeur" class="taille-case-pompierVolontaire"/>
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
