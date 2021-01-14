<%-- 
    Document   : userDetailsInf
    Created on : Jan 13, 2021, 5:25:16 PM
    Author     : eli10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="UserDetailsInf">
    <form method="POST" action="${pageContext.request.contextPath}/UserDetailsInf">
        <div>
            <h5>Username:</h5>
            <p>${userDetailsInf.username}</p>
        </div>

        <div>
            <h5>Email:</h5>
            <p>${userDetailsInf.email}</p>
        </div>

        <div>
            <h5>Phone Number:</h5>
            <p>${userDetailsInf.phoneNumber}</p>
        </div>

        <div>
            <h5>Job Title:</h5>
            <p>${userDetailsInf.jobTitle}</p>
        </div>
        
          <div>
            <h5>Description:</h5>
            <p>${userDetailsInf.description}</p>
        </div>

        <div><h5>Role:</h5>
            <p>${userDetailsInf.roles}</p>
        </div>
    </form>
</t:pageTemplate>
