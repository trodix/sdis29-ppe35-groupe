<%-- 
    Document   : pompierJSP
    Created on : 17 oct. 2017, 11:44:29
    Author     : fabien.ladouce
--%>

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
        <title>Liste des pompiers</title>
    </head>
        <%@include file="navbar.jspf"%>
        <div class="container">
            <div class="table-responsive">
                <table class="table tableau-liste-pompier table-bordered table-striped">
                    <thead>
                    <h3 class="titre-profil">Liste des pompiers</h3><!-- -->
                        <tr>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>Grade</th>
                            <th>Modifier</th>
                            <th>Visualiser</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(maSession.getAttribute("lesPompiers") != null){
                                ArrayList <Pompier> lesPompiers = (ArrayList)maSession.getAttribute("lesPompiers");
                                
                                for(Pompier unPompierListe : lesPompiers){
                                    out.println("<tr><td>" + unPompierListe.getpNom() + "</td><td>" + unPompierListe.getpPrenom()+ "</td><td>" + unPompierListe.getpGrade()+ "</td><td><i class='fa fa-pencil' aria-hidden='true'></i></td><td><i class='fa fa-eye' aria-hidden='true'></i></td></tr>");
                                }
                            }
                         %>
                    </tbody>
                </table>
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
