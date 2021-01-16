<%-- 
    Document   : userSettings
    Created on : Jan 16, 2021, 2:38:25 PM
    Author     : mariu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/user.css"%></style>
<style><%@include file="/position.css"%></style>

<t:pageTemplate pageTitle="UserSettings">
    <h1>User Settings</h1>

    <form method="POST" action="${pageContext.request.contextPath}/UsersSettings">
        <c:choose>
            <c:when test="${usd.id!=null}"> 
                <button class="btn btn-primary" name="user_ids" value="" type="submit">TESTTT</button>
            </c:when>
            <c:otherwise>                             
                <button class="btn btn-primary" name="user_ids" value="" type="submit">Add</button>                                                   
            </c:otherwise>    
        </c:choose>  
    </form>



</t:pageTemplate>