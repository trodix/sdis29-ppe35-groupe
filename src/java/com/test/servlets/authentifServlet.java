/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.servlets;

import com.test.bdd.PompierMYSQL;
import com.test.bdd.UtilisateurMYSQL;
import com.test.beans.Pompier;
import com.test.form.AuthentifForm;
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
 * @author fabien.ladouce
 */
public class authentifServlet extends HttpServlet {

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
            out.println("<title>Servlet authentifServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet authentifServlet at " + request.getContextPath() + "</h1>");
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
        getServletContext().getRequestDispatcher("/WEB-INF/authentifJSP.jsp").forward(request, response);
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
        int pId = 0;
        HttpSession maSession = request.getSession();
        boolean pompier = false;
        boolean chefDeCentre = false;
        boolean responsableDesAlertes = false;
        PompierMYSQL unPompierMYSQL = new PompierMYSQL();
        Pompier unPompier = null;
        AuthentifForm leControle = new AuthentifForm();
        boolean authentification = false; 
        request.setAttribute("controleForm",leControle);
        try {
            if(leControle.controlerAuthentif(request) || authentification){
                
//                maSession.setAttribute("nCaserne",leControle.getnCaserne());
//                maSession.setAttribute("pId", leControle.getpId());
                maSession.setAttribute("isAuthentified",true);
                unPompier = unPompierMYSQL.read(leControle.getnCaserne(), leControle.getpId());
                maSession.setAttribute("unPompier",unPompier);              
                switch(unPompier.getiStatut()){
                    case 1:
                        pompier = true;
                        maSession.setAttribute("pompier", pompier);
                        break;
                    case 2:
                        chefDeCentre = true;
                        maSession.setAttribute("chefDeCentre", chefDeCentre);
                        break;
                    case 3:
                        responsableDesAlertes = true;
                        maSession.setAttribute("pompier", responsableDesAlertes);
                        break;
        }       
            getServletContext().getRequestDispatcher("/WEB-INF/pompierJSP.jsp").forward(request, response);
        }else{
                getServletContext().getRequestDispatcher("/WEB-INF/authentif.jsp").forward(request, response);
                maSession.setAttribute("authentif","Echec authentification");
            }

    }   catch (SQLException ex) {
            Logger.getLogger(authentifServlet.class.getName()).log(Level.SEVERE, null, ex);
            Logger.getLogger(authentifServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
}
}

