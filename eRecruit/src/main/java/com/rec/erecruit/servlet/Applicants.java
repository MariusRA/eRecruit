/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.servlet;

import com.rec.erecruit.common.UserDetails;
import com.rec.erecruit.ejb.ApplicantBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * @author mariu
 */

@DeclareRoles({"UserCRUDRole","PositionCRUDRole","PositionDeleteRole",
    "CandidateCRUDRole","CommentsCRUDRole","ViewerRole","PositionRole"})
@ServletSecurity(
        value = @HttpConstraint(
                rolesAllowed = {"CandidateCRUDRole"}
        )
)
@WebServlet(name = "Applicants", urlPatterns = {"/Applicants"})
public class Applicants extends HttpServlet {

    @Inject
    private ApplicantBean applicantBean;

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
            out.println("<title>Servlet Applicants</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Applicants at " + request.getContextPath() + "</h1>");
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

        request.setAttribute("activePage", "Applicants");
        Integer pId = Integer.parseInt(request.getParameter("posIdForApplicants"));
        request.setAttribute("orice", pId);
        List<UserDetails> users_applicants = applicantBean.applicantsToUsers(applicantBean.getAllApplicants(pId));
        request.setAttribute("users_applicants", users_applicants);

        request.getRequestDispatcher("/WEB-INF/pages/applicants.jsp").forward(request, response);
        //response.sendRedirect(request.getContextPath() + "/Applicants");
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

        Integer posId = Integer.parseInt(request.getAttribute("orice").toString());

        String[] applicantIdsAsString = request.getParameterValues("remove");
        if (applicantIdsAsString != null) {
            List<Integer> applicantIds = new ArrayList<>();
            for (String applicantIdAsString : applicantIdsAsString) {
                applicantIds.add(Integer.parseInt(applicantIdAsString));
            }
            Integer deleteById = applicantBean.findApplicantByUserIdAndPositionId(Integer.parseInt(applicantIdsAsString[0]), posId);
            applicantBean.deleteApplicantsByIds(deleteById);
            response.sendRedirect(request.getContextPath() + "/Applicants");
        }

        //processRequest(request, response);
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
