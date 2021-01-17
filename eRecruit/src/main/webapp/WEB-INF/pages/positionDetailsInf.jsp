<%-- 
    Document   : positionDetails
    Created on : Jan 12, 2021, 10:55:12 AM
    Author     : eli10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/user_details.css"%></style>

<t:pageTemplate pageTitle="PositionDetailsInf">
    <form method="POST" class="user_info" action="${pageContext.request.contextPath}/PositionDetailsInf">
        <div class="info_holder">
            <span>
                <b>Position:</b>
                <p>${positionDetailsInf.name}</p>
            </span>
            <span>
                <b>Department:</b>
                <p>${positionDetailsInf.department}</p>
            </span>
            <span>
                <b>Project:</b>
                <p>${positionDetailsInf.project}</p>
            </span>
            <span>
                <b>Requirements:</b>
                <p>${positionDetailsInf.requirements}</p>
            </span>
            <span><b>Responsibilities:</b>
                <p>${positionDetailsInf.responsibilities}</p>
            </span>
        </div>

        <c:if test="${pageContext.request.isUserInRole('CommentsCRUDRole')}">
            <div class="user_infoT">
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
            </c:if>
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
                        <c:if test="${pageContext.request.isUserInRole('CommentsCRUDRole')}">
                            <td><button class="btn btn-primary" name="deletecom" value="${comm.id}" type="submit">Delete Comment</button></td>
                        </c:if>
                    </tr>    

                </c:forEach>
            </table>
        </div>

    </form>
</t:pageTemplate>
