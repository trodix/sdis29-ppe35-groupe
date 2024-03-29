/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.servlets;

import com.test.bdd.PompierMYSQL;
import com.test.beans.Pompier;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fabien.ladouce
 */
public class listePompierServlet extends HttpServlet {

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
            out.println("<title>Servlet listePompierServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listePompierServlet at " + request.getContextPath() + "</h1>");
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
        Pompier unPompier = null;
        HttpSession maSession = request.getSession();
        
        if(maSession.getAttribute("unPompier") != null){
            unPompier = (Pompier)maSession.getAttribute("unPompier");
        }
        
        if(maSession.getAttribute("pompier") != null || maSession.getAttribute("chefDeCentre") != null || maSession.getAttribute("pompier")  != null){
            
            if((boolean) maSession.getAttribute("chefDeCentre") == true){
                
                PompierMYSQL unPompierMYSQL = new PompierMYSQL();
                
                ArrayList <Pompier> lesPompiers = new ArrayList();
                
                lesPompiers = unPompierMYSQL.readAll(unPompier.getcId());
                System.out.println(lesPompiers);
                maSession.setAttribute("lesPompiers",lesPompiers);
                getServletContext().getRequestDispatcher("/WEB-INF/listePompier.jsp").forward(request, response); 
            }
            
        }
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
        
        getServletContext().getRequestDispatcher("/WEB-INF/listePompier.jsp").forward(request, response);
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
