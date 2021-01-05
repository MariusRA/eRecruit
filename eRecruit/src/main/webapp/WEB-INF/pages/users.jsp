<%-- 
    Document   : users
    Created on : Jan 4, 2021, 8:47:38 PM
    Author     : popa_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">
    <h1>Users</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Users">

        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AddUser" role="button">Add User</a>


        <c:forEach var="user" items="${users}" varStatus="Status">
            <div class="row">
                <div class="col-md">
                    ${user.id}
                </div>
                <div class="col-md-4">
                    ${user.username}
                </div>
                <div class="col-md-4">
                    ${user.mail}
                </div>
                <div class="col-md-3">
                    ${user.nrTel}
                </div>
            </div>
        </c:forEach>
    </form>


</t:pageTemplate>