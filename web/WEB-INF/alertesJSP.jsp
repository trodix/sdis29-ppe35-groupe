<%-- 
    Document   : pompierJSP
    Created on : 17 oct. 2017, 11:44:29
    Author     : fabien.ladouce
--%>

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
        <div class="container">
            <form action="Pompier" method="POST">
                <div class="table-responsive">
                    <table class="table tableau-infos-pompier" border="0">
                            <tr>
                                <td><label for="nom" >Casernes : </label></td>
                                <td>
                                    <select name="caserne" size="1">
                                        <option>Bannalec</option>
                                        <option>Benodet</option>
                                        <option>Brasparts</option>
                                        <option>Brest</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="caserne" size="1">
                                        <option>Bannalec</option>
                                        <option>Benodet</option>
                                        <option>Brasparts</option>
                                        <option>Brest</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="caserne" size="1">
                                        <option>Bannalec</option>
                                        <option>Benodet</option>
                                        <option>Brasparts</option>
                                        <option>Brest</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="caserne" size="1">
                                        <option>Bannalec</option>
                                        <option>Benodet</option>
                                        <option>Brasparts</option>
                                        <option>Brest</option>
                                    </select>
                                </td>
                            </tr>
                    </table>              
                </div>
                <div class="row">
                    <table class="table tableau-infos-pompier" border="0">
                        <tr>
                            <td>Nombre de Pompiers :</td>
                            <td>
                                <select name="nbPompiers" size="1">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>
                            </td>
                            <td>Tranche Horaire :</td>
                            <td>
                                <select name="trancheHoraire" size="1">
                                    <option>Nuit</option>
                                    <option>Matin</option>
                                    <option>Après-Midi</option>
                                    <option>Soir</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="row">
                    <table class="table tableau-infos-pompier" border="0">
                        <tr>
                            <td>Nombre de Pompiers :</td>
                            <td>
                                <select name="nbPompiers" size="1">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>
                            </td>
                            <td>Tranche Horaire :</td>
                            <td>
                                <select name="trancheHoraire" size="1">
                                    <option>Nuit</option>
                                    <option>Matin</option>
                                    <option>Après-Midi</option>
                                    <option>Soir</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <label for="btModification"></label>
                    <input class="btn btn-lg bouton-validation" type="submit" value="Valider modifications" id="btModifications"/>
                </div><br>
            </form>
        </div>
    </body>
</html>
