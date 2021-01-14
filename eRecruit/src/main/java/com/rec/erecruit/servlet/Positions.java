/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.servlet;

import com.rec.erecruit.common.PositionDetails;
import com.rec.erecruit.ejb.PositionBean;
import com.rec.erecruit.ejb.UserBean;
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
 * @author Andrei Paul
 */
@WebServlet(name = "Positions", urlPatterns = {"/Positions"})
public class Positions extends HttpServlet {
    
    @Inject
    private PositionBean positionBean;
    
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
            out.println("<title>Servlet Positions</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Positions at " + request.getContextPath() + "</h1>");
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
              
        String usn = request.getRemoteUser();
        Integer userId = userBean.getIdByUsername(usn);
        List<PositionDetails>[] postemp = positionBean.checkApplied(userId);
        request.setAttribute("notApplied", postemp[0]);
        request.setAttribute("posApplied",postemp[1]);
        request.getRequestDispatcher("/WEB-INF/pages/positions.jsp").forward(request, response);
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
        
        String[] PosIdsAsString = request.getParameterValues("pos_ids");
        if (PosIdsAsString != null) {
            List<Integer> positionIds = new ArrayList<>();
            for (String positionIdAsString : PosIdsAsString) {
                positionIds.add(Integer.parseInt(positionIdAsString));
            }
            positionBean.deletePositionByIds(positionIds);
            response.sendRedirect(request.getContextPath() + "/Positions");
        }

        String[] positionId = request.getParameterValues("apply");
        if (positionId != null) {
            String usn = request.getRemoteUser();
            Integer userId = userBean.getIdByUsername(usn);
            Integer positionId_int = Integer.parseInt(request.getParameterValues("apply")[0]);
            positionBean.createApplicant(userId, positionId_int);          
            response.sendRedirect(request.getContextPath() + "/Positions");

        }
        
        String[] posIdsAsString = request.getParameterValues("send_ids");
        if (posIdsAsString != null) {
            for(String x: posIdsAsString){
                 System.out.println(x);
            }
            request.getServletContext().setAttribute("id_Wich_We_NEED", Integer.parseInt( request.getParameterValues("send_ids")[0]));
            response.sendRedirect(request.getContextPath() + "/Applicants");

        }
        
         String[] positionId2 = request.getParameterValues("unapply");
         if (positionId2 != null) {
            String usn = request.getRemoteUser();
            Integer userId = userBean.getIdByUsername(usn);
            Integer positionId_int = Integer.parseInt(positionId2[0]);
            positionBean.deleteApplicant(userId, positionId_int);
            response.sendRedirect(request.getContextPath() + "/Positions");

        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
