/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.servlet;

import com.rec.erecruit.common.UserDetails;
import com.rec.erecruit.common.UserSettingsDetails;
import com.rec.erecruit.ejb.UserBean;
import com.rec.erecruit.ejb.UserSettingsBean;
import com.rec.erecruit.entity.UserSettings;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andrei Paul
 */
@WebServlet(name = "EditUserSettings", urlPatterns = {"/EditUserSettings"})
public class EditUserSettings extends HttpServlet {
        
        @Inject
        UserSettingsBean userSettingsBean;
        
        @Inject
        UserBean userBean;
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
            out.println("<title>Servlet EditUserSettings</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUserSettings at " + request.getContextPath() + "</h1>");
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
        
       
        
       // List<UserSettings> comm = userSettingsBean.getAllUserSettings();
        //request.setAttribute("comm", comm);

        int commId = Integer.parseInt(request.getParameter("id"));
        UserSettings com = userSettingsBean.findById(commId);
        UserDetails ud=userBean.findById(userBean.getIdByUsername(request.getRemoteUser()));
        UserSettingsDetails usd=new UserSettingsDetails(ud.getId(), ud.getFirstName(),ud.getLastName(),ud.getPhoneNumber(),ud.getEmail(),com.getAddress(),com.getRelocation(),com.getLinkCV(),com.getInterviewDate(),com.getComments(),com.getUserId());
        request.setAttribute("com", usd);
        request.getRequestDispatcher("/WEB-INF/pages/editUserSettings.jsp").forward(request, response);
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
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
