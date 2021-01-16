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
                <div><a>First Name:</a> <a>${usd.firstName}</a></div>
                 <div><a>Last Name:</a> <a>${usd.lastName}</a></div>
                 <div><a>Phone Number:</a> <a>${usd.phoneNumber}</a></div>
                 <div><a>Mobile Phone Number:</a> <a>${usd.mobilePhoneNumber}</a></div>
                 <div><a>Email:</a> <a>${usd.email}</a></div>
                 <div><a>Address:</a> <a>${usd.address}</a></div>
                 <div><a>Relocation:</a> <a>${usd.relocation}</a></div>
                 <div><a>Link CV:</a> <a>${usd.linkCV}</a></div>
                 <div><a>Interview Date:</a> <a>${usd.interviewDate}</a></div>
                 <div><a>Comments:</a> <a>${usd.comments}</a></div>  
                 <div><a class="btn btn-primary" href="${pageContext.request.contextPath}/EditUserSettings?id=${usd.id}" role="button">Edit</a></div>  
           </c:when>
            <c:otherwise>                             
                <button class="btn btn-primary" name="user_ids" value="" type="submit">Add</button>                                                   
            </c:otherwise>    
        </c:choose>  
    </form>



</t:pageTemplate>