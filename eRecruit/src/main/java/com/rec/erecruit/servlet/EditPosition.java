/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.servlet;

import com.rec.erecruit.common.PositionDetails;
import com.rec.erecruit.common.UserDetails;
import com.rec.erecruit.ejb.PositionBean;
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
 * @author Andrei Paul
 */

@DeclareRoles({"UserCRUDRole","PositionCRUDRole","PositionDeleteRole",
    "CandidateCRUDRole","CommentsCRUDRole","ViewerRole","PositionRole"})
@ServletSecurity(
        value = @HttpConstraint(
                rolesAllowed = {"PositionCRUDRole"}
        )
)
@WebServlet(name = "EditPosition", urlPatterns = {"/EditPosition"})
public class EditPosition extends HttpServlet {

    @Inject
    PositionBean positionBean;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditPosition</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPosition at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<PositionDetails> positions = positionBean.getAllPositions();
        request.setAttribute("positions", positions);

        int positionId = Integer.parseInt(request.getParameter("id"));
        PositionDetails position = positionBean.findById(positionId);
        request.setAttribute("position", position);
        request.getRequestDispatcher("/WEB-INF/pages/editPosition.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        int id = Integer.parseInt(request.getParameter("pos_id"));
        int peopleWanted = Integer.parseInt(request.getParameter("number"));
        String department = request.getParameter("dep");
        String project = request.getParameter("project");
        String requirements = request.getParameter("req");
        String responsibilities = request.getParameter("respo");
        boolean status= Boolean.parseBoolean(request.getParameter("status"));
        positionBean.updatePosition(id, name, peopleWanted, department, project, requirements, responsibilities, status);

        response.sendRedirect(request.getContextPath() + "/Positions");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
