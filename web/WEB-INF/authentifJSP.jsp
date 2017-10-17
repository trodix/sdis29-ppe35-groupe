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
    <body class="fond-authentif">
        <div class="container">
            <div class="row">
                <div class="col-md-push-4 col-md-4 ">
                    <div class="marge-logo"><img src="images/logo-sdis.png"></div>
                        <div class="align-right">
                            <form action="authentification" method="POST">
                                <div>
                                    <label for="login" class="bordure-authentif-titre">Nom d'utilisateur-- </label>
                                    <input type="text" name="ztLogin" id="login" class="bordure-authentif-champ"/>
                                </div><br>
                                <div>
                                    <label for="mdp" class="bordure-authentif-titre">Mot de passe </label>
                                    <input type="password" name="ztMDP" id="mdp" class="bordure-authentif-champ"/>
                                </div><br>
                                
                            
                        
                        <div>
                            <label for="btConnexion"></label>
                            <input type="submit" value="Se connecter" id="btConnexion" class="btn bordure-authentif-titre"/>
                        </div>
                    </form>
                            </div><br>
                        <div>
                            <p href=""> J'ai oublié mon mot de passe </p>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>