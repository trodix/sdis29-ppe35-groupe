<%-- 
    Document   : charteJSP
    Created on : 19 oct. 2017, 13:24:55
    Author     : aurelien.thazet
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
        <title>Charte d'utilisation</title>
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
    <body class="fond-pompier charte">
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
                </div>
            </div>
        </div>
        <%@include file="navbar.jspf"%>
        <div class="container">
            <h3 class='titre-profil'>Charte d'utilisation de l'application du Service Départemental d'Incendie et de Secours du Finistère</h3>
            <div>
                <h4>INTRODUCTION</h4>
                <p>
                    La présente charte définit les conditions d’accès et les règles d’utilisation de
                    l'application de gestion des pompiers de SDIS29. Elle a également pour objet de sensibiliser
                    les utilisateurs aux risques liés à l’utilisation de ces ressources en termes d’intégrité
                    et de confidentialité des informations traitées. Ces risques imposent le respect de
                    certaines règles de sécurité et de bonne conduite. L’imprudence, la négligence ou
                    la malveillance d’un utilisateur peuvent en effet avoir des conséquences graves de
                    nature à engager sa responsabilité civile et / ou pénale ainsi que celle de SDIS29.
                </p>
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
