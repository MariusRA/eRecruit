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
        <table class="table table-hover table-dark">
            <tr>
                <td>
                    <input type="text" class="form-control" id="commcontent" name="commcontent" placeholder="What are your thoughts?" value="">
                    <input type="hidden" class="form-control" id="ownerUsn" name="ownerUsn" placeholder="What are your thoughts?" value="${userDetailsInf.username}">
                    <input type="hidden" class="form-control" id="ownerUsn2" name="ownerUsn2" placeholder="What are your thoughts?" value="${idRefresh}">
                </td>
                <td>
                    <button class="btn btn-primary" name="postcom" value="${userDetailsInf.id}" type="submit">Post Comment</button>
                    
                </td>
            </tr>
        </table>
        <table class="table table-hover table-dark">
            <tr>
                <th> Comment </th>
                <th> Made by </th>
                <th> Date created </th>
            </tr> 
            
        <c:forEach var="comm" items="${usercomments}" varStatus="Status">
            <tr>
                <td>${comm.content}</td>
                <td>${comm.username}</td>
                <td>${comm.date}</td>
                <td><button class="btn btn-primary" name="deletecom" value="${comm.id}" type="submit">Delete Comment</button></td>
            </tr>    
            
        </c:forEach>
        </table>
    </form>
</t:pageTemplate>
