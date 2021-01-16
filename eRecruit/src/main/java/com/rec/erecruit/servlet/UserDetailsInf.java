/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.servlet;

import com.rec.erecruit.common.CommentDetails;
import com.rec.erecruit.common.UserDetails;
import com.rec.erecruit.ejb.CommentBean;
import com.rec.erecruit.ejb.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.security.DeclareRoles;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author eli10
 */
@DeclareRoles({"UserCRUDRole","PositionCRUDRole","PositionDeleteRole",
    "CandidateCRUDRole","CommentsCRUDRole","ViewerRole","PositionRole"})
@ServletSecurity(
        value = @HttpConstraint(
                rolesAllowed = {"UserCRUDRole"}
        )
)

@WebServlet(name = "UserDetailsInf", urlPatterns = {"/UserDetailsInf"})
public class UserDetailsInf extends HttpServlet {

    @Inject
    private UserBean userBean;

    @Inject
    private CommentBean commBean;

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
            out.println("<title>Servlet UserDetailsInf</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserDetailsInf at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("activePage", "UserDetailsInf");
        List<UserDetails> usersDetailsInf = userBean.getAllUsers();
        request.setAttribute("userDetailsInf", usersDetailsInf);
        
        // de aici fac eu
        
        int userId = Integer.parseInt(request.getParameter("id"));
        UserDetails userDetailsIn = userBean.findById(userId);
        request.setAttribute("userDetailsInf", userDetailsIn);
        List<CommentDetails> commDetails = commBean.getAllComments(userId);
        request.setAttribute("usercomments", commDetails);
        

        request.getRequestDispatcher("/WEB-INF/pages/userDetailsInf.jsp").forward(request, response);
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

        String[] postcomm = request.getParameterValues("postcomm");
        // comm content
        String currentComm = request.getParameter("commcontent");
        //created by
        Integer createdBy = userBean.getIdByUsername(request.getRemoteUser());
        //owned by
        String[] ownedByUsn = request.getParameterValues("ownerUsn");
        Integer ownedBy = userBean.getIdByUsername(ownedByUsn[0]);  

        if (currentComm != null) {

            commBean.createComment(ownedBy, currentComm, createdBy);

        }
        response.sendRedirect(request.getContextPath() + "/UserDetailsInf?id=" + ownedBy);

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
