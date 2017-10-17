/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.bdd;

import java.sql.Connection;
import java.util.Objects;



/**
 *
 * @author fabien.ladouce
 */
public class UtilisateurMYSQL {
        
    //Connection laConnection = Connexion.getConnect(serveur, bdd, nomUtil, mdp);
    
    private String nomUtilisateur;
    private String mdp;

    public UtilisateurMYSQL(String nomUtilisateur, String mdp) {
        this.nomUtilisateur = nomUtilisateur;
        this.mdp = mdp;
    }

    public String getNomUtilisateur() {
        return nomUtilisateur;
    }

    public String getMdp() {
        return mdp;
    }

    public void setNomUtilisateur(String nomUtilisateur) {
        this.nomUtilisateur = nomUtilisateur;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 19 * hash + Objects.hashCode(this.nomUtilisateur);
        hash = 19 * hash + Objects.hashCode(this.mdp);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final UtilisateurMYSQL other = (UtilisateurMYSQL) obj;
        if (!Objects.equals(this.nomUtilisateur, other.nomUtilisateur)) {
            return false;
        }
        if (!Objects.equals(this.mdp, other.mdp)) {
            return false;
        }
        return true;
    }
    
    
}
