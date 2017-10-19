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
            </div>
            <div class="row">
                <table class="table">
                    <thead>
                        <caption>Liste des pompiers</caption>
                        <a href="/Pompier">Créer un pompier volontaire</a>
                        <tr>
                            <th>Nom</th> <th>Prénom</th> <th>Grade</th> <th>Modifier</th> <th>Visualiser</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        ArrayList <Pompier> lesPompiers = (ArrayList)request.getAttribute("lesPompiers");
                        for(Pompier unPompierListe : lesPompiers){
                            out.println("<tr><td>" + unPompierListe.getpNom() + "</td><td>" + unPompierListe.getpPrenom()+ "</td><td>" + unPompierListe.getpGrade()+ "</td><td><i class='fa fa-pencil' aria-hidden='true'></i></td><td><i class='fa fa-eye' aria-hidden='true'></i></td></tr>");
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
