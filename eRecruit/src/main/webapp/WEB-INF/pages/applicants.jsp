<%-- 
    Document   : applicants
    Created on : Jan 12, 2021, 10:41:52 AM
    Author     : mariu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/general.css"%></style>

<t:pageTemplate pageTitle="Applicants">
    <form method="POST" action="${pageContext.request.contextPath}/Applicants">
        <div class="d-flex justify-content-center" id="show_applicants">
            <table class="table table-hover table-dark">
                <thead>
                    <tr>
                        <th scope="col">Username</th>
                        <th scope="col">Email</th>
                        <th scope="col1" class="options_applicants">Options</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users_applicants}" varStatus="Status">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.email}</td>     
                            <td class="options_applicants">            
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/Candidates?applicantAccepted=${user.id}"role="button">✓</a>
                                <button class="btn btn-primary" name="remove" value="${user.id}" type="submit">X</button>
                           
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    </form>
</t:pageTemplate>

