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
            <div class='row'>
                <h3 class='titre-profil text-center'>Charte d'utilisation de l'application du Service Départemental d'Incendie et de Secours du Finistère</h3>
                <div class='col-md-push-1 col-md-10'>
                    <div>
                        <h4 class='margin-charte-titre'>INTRODUCTION</h4>
                        <p class='margin-charte-article'>
                            La présente charte définit les conditions d’accès et les règles d’utilisation de
                            l'application de gestion des pompiers de SDIS29. Elle a également pour objet de sensibiliser
                            les utilisateurs aux risques liés à l’utilisation de ces ressources en termes d’intégrité
                            et de confidentialité des informations traitées. Ces risques imposent le respect de
                            certaines règles de sécurité et de bonne conduite. L’imprudence, la négligence ou
                            la malveillance d’un utilisateur peuvent en effet avoir des conséquences graves de
                            nature à engager sa responsabilité civile et / ou pénale ainsi que celle de SDIS29.
                        </p>
                    </div>
                    <div>
                        <h4 class='margin-charte-titre'>PROTECTION DES DONNEES A CARACTERE PERSONNEL</h4>
                        <p class='margin-charte-article'>
                            La loi n°78-17 du 6 janvier 1978 modifiée en 2004 relative à l’informatique, aux
                            fichiers et aux libertés définit les conditions dans lesquelles des traitements de
                            données à caractère personnel peuvent être effectués. Elle ouvre aux personnes
                            concernées par les traitements un droit d’accès et de rectification des données
                            enregistrées sur leur compte.
                        </p>
                        <p class='margin-charte-article'>
                            SDIS29 a désigné un correspondant à la protection des données à
                            caractère personnel. Ce dernier a pour mission de veiller au respect des
                            dispositions de la loi n°78-17 du 6 janvier 1978 modifiée.
                        </p>
                        <p class='margin-charte-article'>
                            Il est obligatoirement consulté par le responsable des traitements préalablement à
                            leur création.
                        </p>
                        <p class='margin-charte-article'>
                            Il recense dans un registre la liste de l’ensemble des traitements de données à
                            caractère personnel de SDIS29 au fur et à mesure de leur mise en
                            œuvre. Cette liste est tenue uniquement à disposition des responsables de caserne.
                        </p>
                        <p class='margin-charte-article'>
                            Le correspondant veille au respect des droits des personnes (droit d’accès, de
                            rectification et d’opposition). En cas de difficultés rencontrées lors de l’exercice de
                            ces droits, les personnes concernées peuvent saisir le correspondant du CIL.     
                        </p>
                    </div>
                    <div>
                        <h4 class='margin-charte-titre'>DONNEES A CARACTERE PERSONNEL RECUPEREES</h4>
                        <p class='margin-charte-article'>
                            Une photo est requise pour votre enregistrement au sein de la caserne.
                        </p>
                        <p class='margin-charte-article'>
                            Afin de valider votre enregistrement, les informations suivantes vous seront demandées :
                            nom, prénom ainsi que l'adresse, la ville et le code postal de votre domicile.
                            Si vous êtes salarié d'une entreprise, les informations suivantes concernant cette dernoère 
                            sont également demandées : dénomination sociale et adresse.
                        </p>
                    </div>
                    <div>
                        <h4 class='margin-charte-titre'>FINALITE DES DONNEES A CARACTERE PERSONNEL</h4>
                        <p class='margin-charte-article'>
                            Les donnnées collectées répondent uniquement au besoin minimum de SDIS29.
                        </p>
                        <p class='margin-charte-article'>
                            La photo demandée permet au chef de caserne de vous repérer plus facilement lors
                            d'une sélection pour une intervention.
                        </p>
                        <p class='margin-charte-article'>
                            Les informations concernant votre identité et votre de lieu de domicile permettent
                            de vous joindre plus rapidement en cas de d'urgence ou pour tout autre formalité 
                            administrative relative à la caserne.
                        </p>
                        <p class='margin-charte-article'>
                            Les données récupérées si vous êtes salarié d'une entreprise sont utilisées pour
                            justifier une absence de votre poste durant les horaires indiquées sur votre contrat
                            de travail conclut avec la société en question, en raison d'une urgence nécessitant
                            votre présence en intervention ou dans votre caserne pour le compte de SDIS29.
                        </p>
                    </div>
                    <div class='margin-charte-fin'>
                        <h4 class='margin-charte-titre'>CONSERVATION DES DONNEES A CARACTERE PERSONNEL</h4>
                        <p class='margin-charte-article'>
                            Les données qui sont demandées lors de votre enregistrement seront conservées durant
                            toute la période où vous serez pompier au sein de SDIS29. En dehors de cette période
                            ces dernières seront supprimées du système d'information.
                        </p>
                    </div>
                </div>
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
