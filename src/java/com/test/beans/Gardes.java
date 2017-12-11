/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.beans;

import java.util.Calendar;
import java.util.Objects;

/**
 *
 * @author aurelien.thazet
 */
public class Gardes {
    Calendar jourVentil;
    int horaires;
    Pompier pompier;
    int activite;
    Boolean isInBdd;
    
    public Gardes(Calendar jourVentil, int horaires, Pompier pompier, int activite) {
        this.jourVentil = jourVentil;
        this.horaires = horaires;
        this.pompier = pompier;
        this.activite = activite;
    }

    public Calendar getJourVentil() {
        return jourVentil;
    }

    public void setJourVentil(Calendar jourVentil) {
        this.jourVentil = jourVentil;
    }

    public int getHoraires() {
        return horaires;
    }

    public void setHoraires(int horaires) {
        this.horaires = horaires;
    }

    public Pompier getPompier() {
        return pompier;
    }

    public void setPompier(Pompier pompier) {
        this.pompier = pompier;
    }

    public int getActivite() {
        return activite;
    }

    public void setActivite(int activite) {
        this.activite = activite;
    }

    public boolean getIsInInBdd() {
        return isInBdd;
    }

    public void setIsInBdd(boolean isInBdd) {
        this.isInBdd = isInBdd;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 71 * hash + Objects.hashCode(this.jourVentil);
        hash = 71 * hash + Objects.hashCode(this.horaires);
        hash = 71 * hash + Objects.hashCode(this.pompier);
        hash = 71 * hash + this.activite;
        hash = 71 * hash + (this.isInBdd ? 1 : 0);
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
        final Gardes other = (Gardes) obj;
        if (!Objects.equals(this.horaires, other.horaires)) {
            return false;
        }
        if (!Objects.equals(this.jourVentil, other.jourVentil)) {
            return false;
        }
        if (!Objects.equals(this.pompier, other.pompier)) {
            return false;
        }
        return true;
    }

    

    @Override
    public String toString() {
        return "ventil{" + "jourVentil=" + jourVentil.getTime() + ", periode=" + horaires + ", pompier=" + pompier + ", activite=" + activite + ", isInBdd=" + isInBdd + '}';
    }
}
