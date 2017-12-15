#Requête authentification#
SELECT pId, pLogin, pMdp FROM pompier WHERE pLogin = ? AND pMdp = ?

#Requête modification pompier volontaire#
SELECT pNom, pPrenom, pAdresse, pVille, pCp, pMail, pBip, pUrlPhoto, pCommentaire, cNom 
FROM pompier INNER JOIN caserne ON pCis = cId WHERE pCis = 2901 AND pId = 1

#Requête liste des pompiers#
SELECT pNom, pPrenom, pLibelle FROM pompier 
INNER JOIN parametre ON pGrade = pIndice 
WHERE parametre.pType = "Grade" AND pId = 1