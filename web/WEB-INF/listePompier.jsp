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
                    <div class="col-md-8">
                        <h1 class="text-right titre-profil marge-titre-profil">
                            <% 
                                out.println("Caserne " + unPompier.getcNom() + " : " + unPompier.getpNom() + " " + unPompier.getpPrenom()); 
                            %>
                        </h1>
                    </div>
                    <div class="col-md-push-3 col-md-4">
                         <div><img src="images/test.jpg" class="img-responsive img-rounded" width="150" height="150"></div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="navbar.jspf"%>
        <div class="container">
            <div class="table-responsive">
                <table class="table tableau-liste-pompier table-bordered table-striped">
                    <thead>
                        <caption>Liste des pompiers</caption>
                        <a href="creerPompier">Créer un pompier volontaire</a>
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
