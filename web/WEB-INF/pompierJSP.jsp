<%-- 
    Document   : pompierJSP
    Created on : 17 oct. 2017, 11:44:29
    Author     : fabien.ladouce
--%>

<%@page import="com.test.form.AuthentifForm"%>
<%@page import="com.test.form.AuthentifForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Pompier Volontaire</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div>
                    <div class="marge-logo"><img src="images/logo-sdis.png"></div>
                    <p> Caserne : nom de la caserne, Nom Prénom Pompier</p>
                    <img src="images/test.jpg" class="rounded">
                </div>
                <form action="" method="POST">
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
                            <input type="text" name="ztNom" id="nom"/>
                        </div><br>
                        <div>
                            <input type="text" name="ztPrenom" id="prenom"/>
                        </div><br>
                        <div>
                            <input type="text" name="ztAdresse" id="adresse"/>
                        </div><br>
                        <div>
                            <input type="text" name="ztVille" id="ville"/>
                        </div><br>
                        <div>
                            <input type="text" name="ztCP" id="cp"/>
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
                            <label for="caserneAppartenance" >Caserne d'Appartenance : </label>
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
                            <input type="email" name="emailAdresse" id="adresseMail"/>
                        </div><br>
                        <div>
                            <select name="caserneAppartenance" id="caserneAppartenance">
                                <option value="Benodet">Benodet</option>
                                <option value="Bannalec">Bannalec</option>
                                <option value="Brasparts">Brasparts</option>
                            </select>
                        </div><br>
                        <div>
                            <select name="statut" id="statut">
                                <option value="Volontaire">Pompier Volontaire</option>
                                <option value="Pro">Pompier Professionel</option>
                                <option value="Medical">Personnel Médical</option>
                            </select>
                        </div><br>
                        <div>
                            <select name="grade" id="grade">
                                <option value="Adjudant">Adjudant</option>
                                <option value="AdjudantChef">Adjudant-Chef</option>
                                <option value="Capitaine">Capitaine</option>
                            </select>
                        </div><br>
                        <div>
                            <input type="text" name="noBip" id="noBip"/>
                        </div><br>
                    </div>
                    <div class="col-md-1">
                        <div>
                            <i class="fa fa-pencil" aria-hidden="true"></i>
                        </div><br>
                    </div>
                    <div class="col-md-4">
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
                                <input type="text" name="ztDenomination" id="denomination"/>
                            </div><br>
                            <div>
                                <input type="text" name="ztAdresseEmployeur" id="adresseEmployeur"/>
                            </div><br>
                        </div><br>
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
        </div>
        
        <!--<%
            AuthentifForm leControle = (AuthentifForm) request.getAttribute("controleForm");
            if(leControle != null){
                out.println(leControle.getResultat());
            }
        %>-->
    </body>
</html>
