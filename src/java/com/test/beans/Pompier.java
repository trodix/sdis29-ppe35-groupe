/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.beans;

import java.util.Objects;

/**
 *
 * @author sebastien.vallet
 */
public class Pompier {
    
    private int cId;
    private int pId;
    private String pNom;
    private String pPrenom;
    private String pAdresse;
    private String pVille;
    private String pCp;
    private String pMail;
    private String pBip;
    private String pUrlPhoto;
    private String pCommentaire;
    private String cNom;
    private String EmpRaisonSoc;
    private String EmpAdresse;

    public Pompier(int cId, int pId, String pNom, String pPrenom, String pAdresse, String pVille, String pCp, String pMail, String pBip, String pUrlPhoto, String pCommentaire, String cNom, String EmpRaisonSoc, String EmpAdresse) {
        this.cId = cId;
        this.pId = pId;
        this.pNom = pNom;
        this.pPrenom = pPrenom;
        this.pAdresse = pAdresse;
        this.pVille = pVille;
        this.pCp = pCp;
        this.pMail = pMail;
        this.pBip = pBip;
        this.pUrlPhoto = pUrlPhoto;
        this.pCommentaire = pCommentaire;
        this.cNom = cNom;
        this.EmpRaisonSoc = EmpRaisonSoc;
        this.EmpAdresse = EmpAdresse;
    }

    public String getEmpRaisonSoc() {
        return EmpRaisonSoc;
    }

    public String getEmpAdresse() {
        return EmpAdresse;
    }

    public void setEmpRaisonSoc(String EmpRaisonSoc) {
        this.EmpRaisonSoc = EmpRaisonSoc;
    }

    public void setEmpAdresse(String EmpAdresse) {
        this.EmpAdresse = EmpAdresse;
    }
    
    

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpNom() {
        return pNom;
    }

    public void setpNom(String pNom) {
        this.pNom = pNom;
    }

    public String getpPrenom() {
        return pPrenom;
    }

    public void setpPrenom(String pPrenom) {
        this.pPrenom = pPrenom;
    }

    public String getpAdresse() {
        return pAdresse;
    }

    public void setpAdresse(String pAdresse) {
        this.pAdresse = pAdresse;
    }

    public String getpVille() {
        return pVille;
    }

    public void setpVille(String pVille) {
        this.pVille = pVille;
    }

    public String getpCp() {
        return pCp;
    }

    public void setpCp(String pCp) {
        this.pCp = pCp;
    }

    public String getpMail() {
        return pMail;
    }

    public void setpMail(String pMail) {
        this.pMail = pMail;
    }

    public String getpBip() {
        return pBip;
    }

    public void setpBip(String pBip) {
        this.pBip = pBip;
    }

    public String getpUrlPhoto() {
        return pUrlPhoto;
    }

    public void setpUrlPhoto(String pUrlPhoto) {
        this.pUrlPhoto = pUrlPhoto;
    }

    public String getpCommentaire() {
        return pCommentaire;
    }

    public void setpCommentaire(String pCommentaire) {
        this.pCommentaire = pCommentaire;
    }

    public String getcNom() {
        return cNom;
    }

    public void setcNom(String cNom) {
        this.cNom = cNom;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 73 * hash + this.cId;
        hash = 73 * hash + this.pId;
        hash = 73 * hash + Objects.hashCode(this.pNom);
        hash = 73 * hash + Objects.hashCode(this.pPrenom);
        hash = 73 * hash + Objects.hashCode(this.pAdresse);
        hash = 73 * hash + Objects.hashCode(this.pVille);
        hash = 73 * hash + Objects.hashCode(this.pCp);
        hash = 73 * hash + Objects.hashCode(this.pMail);
        hash = 73 * hash + Objects.hashCode(this.pBip);
        hash = 73 * hash + Objects.hashCode(this.pUrlPhoto);
        hash = 73 * hash + Objects.hashCode(this.pCommentaire);
        hash = 73 * hash + Objects.hashCode(this.cNom);
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
        final Pompier other = (Pompier) obj;
        return true;
    }

    @Override
    public String toString() {
        return "Pompier{" + "cId=" + cId + ", pId=" + pId + ", pNom=" + pNom + ", pPrenom=" + pPrenom + ", pAdresse=" + pAdresse + ", pVille=" + pVille + ", pCp=" + pCp + ", pMail=" + pMail + ", pBip=" + pBip + ", pUrlPhoto=" + pUrlPhoto + ", pCommentaire=" + pCommentaire + ", cNom=" + cNom + '}';
    }
    
    
    
}
