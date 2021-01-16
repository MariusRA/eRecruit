<%-- 
    Document   : users
    Created on : Jan 4, 2021, 8:47:38 PM
    Author     : popa_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/user.css"%></style>

<t:pageTemplate pageTitle="Users">
    <form method="POST" action="${pageContext.request.contextPath}/Users">
        <span class="category">Add User</span>
        <div class="d-flex justify-content-center" id="add_user">
            <c:if test="${pageContext.request.isUserInRole('UserCRUDRole')}">
                <div class="holder_btn">
                    <a class="button_add btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AddUser" role="button">
                        <div class="add_btn">
                            <span class="icon"></span>
                            <span class="text">Add new user</span>
                        </div>
                    </a>
                </div>
            </c:if>
        </div>  
        <table class="table addUser_table">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Username</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone</th> 
                    <th scope="col1" class="options_user">Options</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}" varStatus="Status">
                    <tr>
                        <td>${user.id}</td>
                        <td>
                            <c:if test="${pageContext.request.isUserInRole('UserCRUDRole')}">
                                <a href="${pageContext.request.contextPath}/UserDetailsInf?id=${user.id}">${user.username}</a>
                            </c:if>
                        </td>
                        <td>${user.email}</td>     
                        <td>${user.phoneNumber}</td>
                        <td class="options_user">
                            <c:if test="${pageContext.request.isUserInRole('UserCRUDRole')}">
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/EditUser?id=${user.id}" role="button">Edit</a>                                               
                                <button class="btn btn-primary" name="user_ids" value="${user.id}" type="submit">Delete</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </form>
</t:pageTemplate>

<style>

</style>