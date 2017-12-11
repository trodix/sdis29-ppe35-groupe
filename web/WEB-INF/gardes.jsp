<%-- 
    Document   : gardes
    Created on : 11 déc. 2017, 16:26:28
    Author     : sebastien.vallet
--%>


<%@page import="com.personnelTP.util.TrmtDate"%>
<%@page import="com.test.beans.Gardes"%>
<%@page import="java.util.Calendar"%>
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
        <title>Liste des gardes</title>
    </head>
        <%@include file="navbar.jspf"%>
        <% 
            String[] lesCouleurs = {"vert", "orange", "rouge"};
            ArrayList <Gardes> lesGardes = (ArrayList)maSession.getAttribute("lesGardes");
            
            int idPompier = 0;
            /**Calendar[] dates = (Calendar[])maSession.getAttribute("dates");
            String[] periodes = (String[])maSession.getAttribute("periodes");**/
        %>
        <div class="container">
            <h1>Liste des gardes</h1>
            <form method="POST" action="gardes">
                <table>
                    <thead>
                        <tr colspan = 2></tr>
                        <tr>
                            <% 
                            //for(Calendar date : dates){
                             //   out.println("<th colspan = 4>" + TrmtDate.getDateAAfficher(date) + "</th>");
                            //} 
                            %>
                        </tr>
                        <tr>
                            <%
                                //for(Calendar date : dates){
                                   // for(String periode : periodes){
                                   //     out.println("<td>" + periode + "</td>");
                                   // }
                                //}
                            %>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        <%
                            for(Gardes uneGarde : lesGardes){
                                int affect = uneGarde.getActivite();
                                String zoneInput = "<input type='number' min=0 max=2 readonly='readonly' class='ztCodeV centrer " + lesCouleurs[affect] + "' name ='tabGardes' value=" + affect + " />";
     
                                if(uneGarde.getPompier().getpId() != idPompier){
                                    out.println("</tr><tr>");
                                    idPompier = uneGarde.getPompier().getpId();
                                    out.println("<td>" + uneGarde.getPompier().getpId() + "</td>");
                                    
                                    out.println("<td>" + uneGarde.getPompier().getpNom() + " " + uneGarde.getPompier().getpNom() + uneGarde.getPompier().getpPrenom() + "</td>");
                                    out.println("<td>" + zoneInput + "</td>");
                                }else{
                                    out.println("<td>" + zoneInput + "</td>");
                                }    
                            }
                        %>
                        </tr>                    
                    </tbody>
                </table>
            </form>
        </div>     
    </body>
       
