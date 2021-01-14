<%-- 
    Document   : positions
    Created on : Jan 7, 2021, 2:58:29 PM
    Author     : popa_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Positions">
    <form method="POST" action="${pageContext.request.contextPath}/Positions">
        <div class="d-flex justify-content-center">
            <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AddPosition" role="button">Add Position</a>
        </div>  
        <h1>YOU APPLIED FOR</h1>
        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Department</th>
                    <th scope="col">Project</th> 
                    <th scope="col">Status</th> 
                    <th scope="col" class="options_position">Options</th>
                    <th scope="col">Apply</th>
                </tr>
            </thead>
            <tbody>               
                <c:forEach var="position" items="${posApplied}" varStatus="Status">                  
                    <tr>                        
                        <td><a href="${pageContext.request.contextPath}/PositionDetailsInf?id=${position.id}">${position.name}</a></td>   
                        <td>${position.department}</td>
                        <td>${position.project}</td>
                        <td>${position.status ? "Open" : "Closed"}</td>
                        <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
                            <td class="options_position">
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/EditPosition?id=${position.id}" role="button">Edit</a>
                                <button class="btn btn-primary" name="pos_ids" value="${position.id}" type="submit">Delete</button>
                                <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/Applicants?posIdForApplicants=${position.id}" role="button">View Applicants</a>

                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${position.status==true}">                                     
                                        <button class="btn btn-primary" name="unapply" value="${position.id}"type="submit">Unapply</button>
                                    </c:when>
                                    <c:otherwise>                             
                                        <button class="btn btn-primary" type="button" disabled>CLOSED</button>                                                   
                                    </c:otherwise>    
                                </c:choose>

                            </td>
                        </c:if>                         
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <h1>YOU CAN APPLY FOR</h1>
        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Department</th>
                    <th scope="col">Project</th> 
                    <th scope="col">Status</th> 
                    <th scope="col" class="options_position">Options</th>
                    <th scope="col">Apply</th>
                </tr>
            </thead>
            <tbody>  

                <c:forEach var="position1" items="${notApplied}" varStatus="Status">                    
                    <tr>
                        <td><a href="${pageContext.request.contextPath}/PositionDetailsInf?id=${position1.id}">${position1.name}</a></td>   
                        <td>${position1.department}</td>
                        <td>${position1.project}</td>
                        <td>${position1.status ? "Open" : "Closed"}</td>
                        <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
                            <td class="options_position">
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/EditPosition?id=${position1.id}" role="button">Edit</a>
                                <button class="btn btn-primary" name="pos_ids" value="${position1.id}" type="submit">Delete</button>
                                <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/Applicants?posIdForApplicants=${position1.id}" role="button">View Applicants</a>

                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${position1.status==true}">
                                        <button class="btn btn-primary" name="apply" value="${position1.id}"type="submit">Apply</button>
                                    </c:when>
                                    <c:otherwise>                              
                                        <button class="btn btn-primary" type="button" disabled>CLOSED</button>                                                 
                                    </c:otherwise>    
                                </c:choose>                            
                            </td>
                        </c:if> 
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </form>
</t:pageTemplate>
<style>
    .options_position {
        text-align: center;
    }
</style>
