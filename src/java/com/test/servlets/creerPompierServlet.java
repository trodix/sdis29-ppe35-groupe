/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.servlets;

import com.test.bdd.PompierMYSQL;
import com.test.beans.Pompier;
import com.test.md5.Md5;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sebastien.vallet
 */
public class creerPompierServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet creerPompierServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet creerPompierServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        getServletContext().getRequestDispatcher("/WEB-INF/nouveauPompier.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        Pompier unPompier = null;
        HttpSession maSession = request.getSession();
        if(maSession.getAttribute("unPompier") != null){
            unPompier = (Pompier)maSession.getAttribute("unPompier");
        }
        PompierMYSQL unPompierMYSQL = new PompierMYSQL();
        String nom = request.getParameter("ztNom");
        String prenom = request.getParameter("ztPrenom");
        String statut = request.getParameter("statut");
        int type = 2;
        String mail = request.getParameter("emailAdresse");
        String login = prenom.substring(0,1);
        login.toUpperCase();
        login += nom.substring(0,3);
        System.out.println(login);
        String mdp = Md5.getMD5(login);
        int idStatut = 0;
        String adresse = request.getParameter("ztVille");
        String ville = request.getParameter("ztville");
        int id = Integer.parseInt(request.getParameter("id"));
        int bip = Integer.parseInt(request.getParameter("noBip"));
        int cp = Integer.parseInt(request.getParameter("ztCP"));
        String urlPhoto = request.getParameter("grdg");
        String raisonSoc = request.getParameter("ztDenomination");
        String emplAdresse = request.getParameter("ztAdresseEmployeur");
        if(statut.equals("pompier")){
            idStatut = 2;
        }
        String com = request.getParameter("ztCom");
        
        
        try {
            unPompierMYSQL.create(unPompier.getcId(),id, nom, prenom, idStatut, type,mail,login,mdp,adresse
                    ,cp,ville,bip, com, urlPhoto,raisonSoc,emplAdresse, unPompier.getpId());
            getServletContext().getRequestDispatcher("/WEB-INF/nouveauPompier.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(creerPompierServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
