<%-- 
    Document   : authentifJSP
    Created on : 17 oct. 2017, 08:43:19
    Author     : aurelien.thazet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" title="Bootstrap" href="css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentification</title>
    </head>
    <body>
        <div><img src="images/logo-sdis.png"></div>
        <form action="authentification" method="POST">
            <p><label for="login" style="bordure-authentif-titre">Nom d'utilisateur </label><br>
                <input type="text" name="ztLogin" id="login" />
            </p><br>
            <p><label for="mdp" style="bordure-authentif-titre">Mot de passe </label><br>
                <input type="password" name="ztMDP" id="mdp" />
            </p><br>
            <p><label for="btConnexion"></label>
                <input type="submit" value="Se connecter" id="btConnexion"/>
            </p><br>
            <div>
                <p href=""> J'ai oublié mon mot de passe </p>
            </div>
        </form> 
    </body>
</html>