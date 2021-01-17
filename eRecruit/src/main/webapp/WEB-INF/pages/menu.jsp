<%-- 
    Document   : menu
    Created on : Jan 4, 2021, 1:46:43 PM
    Author     : eli10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="${pageContext.request.contextPath}">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/about.jsp">About us</a>
            </li>

            <c:if test="${pageContext.request.isUserInRole('UserCRUDRole')}">
                <li class="nav-item ${activePage eq "Users" ? ' active' : ''}">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Users">Users</a>
                </li>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('PositionRole')}">
                <li class="nav-item ${activePage eq "Positions" ? ' active' : ''}">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Positions">Positions</a>
                </li>  
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('ViewerRole')}">
                <li class="nav-item ${activePage eq "UserSettings" ? ' active' : ''}">
                    <a class="nav-link" href="${pageContext.request.contextPath}/UsersSettings">Settings</a>
                </li> 
            </c:if>
        </ul>
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <c:choose>
                    <c:when test="${pageContext.request.getRemoteUser() == null}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Login">Login</a>   
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link" href="${pageContext.request.contextPath}/Logout">Logout</a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </div>
</nav>

