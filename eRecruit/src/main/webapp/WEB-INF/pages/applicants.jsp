<%-- 
    Document   : applicants
    Created on : Jan 12, 2021, 10:41:52 AM
    Author     : mariu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                            <td>${user.firstName} </td>
                            <td>${user.email}</td>     
                            <td class="options_applicants">            
                                
                                <a class="btn btn-primary" href="${user.linkCV}"  name="viewCv" value="">View CV</button>    
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/Interview?applicantAccepted=${user.id}"role="button">✓</a>
                                
                                <button class="btn btn-primary" name="remove" value="${user.userId}" type="submit">X</button>
                                <input type="hidden" id="idPos" name="idPos" placeholder="${posIdForApplicants}" value="${posIdForApplicants}">
                                <input type="hidden" id="id2" name="id2" placeholder="${user.id}" value="${user.id}">

                                 
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    </form>
</t:pageTemplate>

