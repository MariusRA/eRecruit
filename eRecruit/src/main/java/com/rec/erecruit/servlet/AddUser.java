/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.servlet;

import com.rec.erecruit.ejb.UserBean;
import com.rec.erecruit.util.PasswordUtil;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author popa_
 */

@DeclareRoles({"UserCRUDRole","PositionCRUDRole","PositionDeleteRole",
    "CandidateCRUDRole","CommentsCRUDRole","ViewerRole","PositionRole"})
@ServletSecurity(
        value = @HttpConstraint(
                rolesAllowed = {"UserCRUDRole"}
        )
)
@WebServlet(name = "AddUser", urlPatterns = {"/AddUser"})
public class AddUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Inject
    UserBean userBean;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUser at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/WEB-INF/pages/addUser.jsp").forward(request, response);
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

        String lastName = request.getParameter("last");
        String firstName = request.getParameter("first");
        String phoneNumber = request.getParameter("phone");
        String mobilePhoneNumber = request.getParameter("mobile");
        String email = request.getParameter("email");
        String jobTitle = request.getParameter("job");
        String description = request.getParameter("description");
        String password = request.getParameter("password");
        String roles = request.getParameter("roles");

        String passwordSha256 = PasswordUtil.convertToSha256(password);

        userBean.createUser(firstName, lastName, phoneNumber, mobilePhoneNumber, email, jobTitle, description, passwordSha256, roles);

        response.sendRedirect(request.getContextPath() + "/Users");
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
