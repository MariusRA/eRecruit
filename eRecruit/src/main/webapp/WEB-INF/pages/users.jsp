<%-- 
    Document   : users
    Created on : Jan 4, 2021, 8:47:38 PM
    Author     : popa_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">
    <form method="POST" action="${pageContext.request.contextPath}/Users">
        <div class="d-flex justify-content-center">
        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AddUser" role="button">Add User</a>
        </div>  
        <table class="table">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Username</th>
                 <th scope="col">Email</th>
                <th scope="col">Nr.Telefon</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}" varStatus="Status">
          <tr>
              <td>${user.id}</td>
              <td>${user.username}</td>
              <td>${user.email}</td>     
              <td>${user.phoneNumber}</td>
              <td>
                  <a class="btn btn-primary" href="${pageContext.request.contextPath}/EditUser?id=${user.id}" role="button">Edit</a>
                 <button class="btn btn-primary" name="user_ids" value="${user.id}" type="submit">Delete</button>
              </td>
          </tr>
        </c:forEach>
          </tbody>
        </table>
    </form>


</t:pageTemplate>