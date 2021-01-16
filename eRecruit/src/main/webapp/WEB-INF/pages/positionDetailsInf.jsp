<%-- 
    Document   : positionDetails
    Created on : Jan 12, 2021, 10:55:12 AM
    Author     : eli10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/general.css"%></style>

<t:pageTemplate pageTitle="PositionDetailsInf">
    <form method="POST" action="${pageContext.request.contextPath}/PositionDetailsInf">
        <div>
            <h5>Position:</h5>
            <p>${positionDetailsInf.name}</p>
        </div>

        <div>
            <h5>Department:</h5>
            <p>${positionDetailsInf.department}</p>
        </div>

        <div>
            <h5>Project:</h5>
            <p>${positionDetailsInf.project}</p>
        </div>

        <div>
            <h5>Requirements:</h5>
            <p>${positionDetailsInf.requirements}</p>
        </div>

        <div><h5>Responsibilities:</h5>
            <p>${positionDetailsInf.responsibilities}</p>
        </div>
        
       
        
        <table class="table table-hover table-dark">
            <tr>
                <td>
                    <input type="text" class="form-control" id="commcontent" name="commcontent" placeholder="What are your thoughts?" value="">
                    <input type="hidden" class="form-control" id="ownerUsn" name="ownerUsn" placeholder="What are your thoughts?" value="${positionDetailsInf.id}">
                    <input type="hidden" class="form-control" id="ownerUsn2" name="ownerUsn2" placeholder="What are your thoughts?" value="${idRefresh}">
                </td>
                <td>
                    <button class="btn btn-primary" name="postcom" value="${positionDetailsInf.id}" type="submit">Post Comment</button>
                    
                </td>
            </tr>
        </table>
        <table class="table table-hover table-dark">
            <tr>
                <th> Comment </th>
                <th> Made by </th>
                <th> Date created </th>
            </tr> 
            
        <c:forEach var="comm" items="${positioncomments}" varStatus="Status">
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
