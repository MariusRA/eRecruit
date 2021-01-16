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
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mariu
 */
@WebServlet(name = "UsersSettings", urlPatterns = {"/UsersSettings"})
public class UsersSettings extends HttpServlet {

    @Inject
    private UserSettingsBean userSettingsBean;

    @Inject
    private UserBean userBean;

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
            out.println("<title>Servlet UsersSettings</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UsersSettings at " + request.getContextPath() + "</h1>");
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

        List<UserDetails> userDetails = userBean.getAllUsers();
        List<UserSettings> userSettings = userSettingsBean.getAllUserSettings();
        List<UserSettingsDetails> userDetailsSettings = new ArrayList<>();
        UserSettingsDetails usd = new UserSettingsDetails();
        for (UserDetails ud : userDetails) {
            for (UserSettings us : userSettings) {
                if (ud.getId().equals(us.getUserId())) {
                    usd.setId(userBean.getIdByUsername(request.getRemoteUser()));
                    usd.setFirstName(ud.getFirstName());
                    usd.setLastName(ud.getLastName());
                    usd.setPhoneNumber(ud.getPhoneNumber());
                    usd.setEmail(ud.getEmail());
                    usd.setAddress(us.getAddress());
                    usd.setRelocation(us.getRelocation());
                    usd.setLinkCV(us.getLinkCV());
                    usd.setInterviewDate(us.getInterviewDate());
                    usd.setComments(us.getComments());
                    usd.setUserId(us.getUserId());
                }
            }
        }
        
        if(userSettingsBean.checkIdInDb(usd.getId())){
            request.setAttribute("usd",usd);
        }
        else{
            request.setAttribute("usd", null);
        }
        
        request.getRequestDispatcher("/WEB-INF/pages/userSettings.jsp").forward(request, response);
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

        
        String[] isTheButtonPressed=request.getParameterValues("settingsSave");
        if(isTheButtonPressed!=null){
            String relocationStatus[]=request.getParameterValues("relocation");
            String address=request.getParameter("relocation");
            String cvLink=request.getParameter("cv");
            String interviewDate="No interview set yet";
            String comms="Nobody has commented yet";
            
            String usn= request.getRemoteUser();
            Integer idusn=userBean.getIdByUsername(usn);
            UserDetails currentUser=userBean.findById(idusn);
            
            userSettingsBean.createUserSettings(address,relocationStatus[0],cvLink,interviewDate,comms,idusn);
            
        }
        
        response.sendRedirect(request.getContextPath()+"/UsersSettings");
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
