<%-- 
    Document   : users
    Created on : Jan 4, 2021, 8:47:38 PM
    Author     : popa_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">
    <form method="POST" action="${pageContext.request.contextPath}/Users">
        <div class="d-flex justify-content-center" id="add_user">
        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AddUser" role="button">Add User</a>
        </div>  
        <table class="table table-hover table-dark">
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
              <td><a href="${pageContext.request.contextPath}/UserDetailsInf?id=${user.id}">${user.username}</a></td>
              <td>${user.email}</td>     
              <td>${user.phoneNumber}</td>
              <td class="options_user">
                  <a class="btn btn-primary" href="${pageContext.request.contextPath}/EditUser?id=${user.id}" role="button">Edit</a>
                 <button class="btn btn-primary" name="user_ids" value="${user.id}" type="submit">Delete</button>
              </td>
          </tr>
        </c:forEach>
          </tbody>
        </table>
    </form>
</t:pageTemplate>

<style>
    .table-dark {
        background-color: hsl(81, 0%, 42%);
    }
    .table {
        margin: 0 auto;
        width: 80%;
    }
    body {
        background-image: url('${pageContext.request.contextPath}/carousel/leaf.jpg');
    }
    thead,
    .options_user a, 
    .options_user button {
        background-color: hsl(86, 6%, 26%);
    }
    .options_user {
        text-align: right;
    }
    .options_user a, 
    .options_user button {
        border-color: hsl(86, 6%, 20%);
    }
    .options_user a:hover,
    .btn-primary:active,
    .btn-primary:hover {
        background-color:  hsl(89, 5%, 37%) !important;
        border-color:  hsl(89, 5%, 37%) !important;
    }
    #add_user {
        margin: 25px 0;
    }
    #add_user a {
        background-color: hsl(74, 34%, 24%);
        border-color: hsl(66, 39%, 24%);
    }
    form {
        padding-bottom: 70px;
    }
</style>