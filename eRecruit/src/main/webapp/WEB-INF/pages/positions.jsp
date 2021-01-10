<%-- 
    Document   : positions
    Created on : Jan 7, 2021, 2:58:29 PM
    Author     : popa_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Positions">
    <form method="POST" action="${pageContext.request.contextPath}/Positions">
        <div class="d-flex justify-content-center">
        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AddPosition" role="button">Add Position</a>
        </div>  
        <table class="table">
        <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Department</th>
                <th scope="col">Project</th> 
                <th scope="col">Status</th> 
            </tr>
        </thead>
        <tbody>
        <c:forEach var="position" items="${positions}" varStatus="Status">
          <tr>
              <td>${position.name}</td>   
              <td>${position.department}</td>
              <td>${position.project}</td>
              <td>${position.status ? "Open" : "Closed"}</td>
               <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
              <td>
                  <a class="btn btn-primary" href="${pageContext.request.contextPath}/EditPosition?id=${position.id}" role="button">Edit</a>
                  <button class="btn btn-primary" name="pos_ids" value="${position.id}" type="submit">Delete</button>
              </td>
              </c:if>
              <c:if test="${position.status=='true'}">
              <td>
                   <button class="btn btn-primary" name="apply" value="${position.id}"type="submit">Apply</button>
              </td>
              </c:if>
          </tr>
        </c:forEach>
          </tbody>
        </table>
    </form>


</t:pageTemplate>