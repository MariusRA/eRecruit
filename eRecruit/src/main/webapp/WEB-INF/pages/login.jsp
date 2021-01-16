<%-- 
    Document   : login
    Created on : Jan 5, 2021, 11:42:18 PM
    Author     : Denisa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/general.css"%></style>
<style><%@include file="/login.css"%></style>
<!DOCTYPE html>
<t:pageTemplate pageTitle="Login"> 
 
<div class="login-container">

    <form class="form-signin" method="POST" action="j_security_check">
        <h1 class="h3 mb-3 font-wight-normal">Log in</h1>
        <label for="username" class="sr-only">Username</label>
        <input type="text" id="USERNAME" name="j_username" class="form-control" placeholder="Username" required autofocus />
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="PASSWORD" name="j_password" class="form-control" placeholder="Password" required />
        <button class="btn btn-lg btn-block" type="submit">Sign in</button>
    </form>

</div>
</t:pageTemplate>
