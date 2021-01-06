<%-- 
    Document   : login
    Created on : Jan 5, 2021, 11:42:18 PM
    Author     : Denisa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<style>
    .login-container {
        background: url("${pageContext.request.contextPath}/carousel/2522-login.jpg");
        width: 100%;
        background-size: cover;
        height: 578px;
    }
    .custom-radio {
        width: 160px;
        float: left;
        }
    .custom-control-input:disabled~.custom-control-label {
        color: #ffffff;
    }
    .form-signin button {
        background-color: hsl(282, 24%, 33%)
    }
    .form-signin {
        width: 700px;
        margin: 0 auto;
        padding-top: 10px;
        z-index: 999;
        background-color: hsla(282, 24%, 33%, 0.7); 
        padding: 20px 10px 15px 10px;
        
    }
    .form-control {
        border :1px solid #880027;
    }
    .form-signin input, 
    .custom-control {
        margin-bottom: 12px;
    }
    .form-signin h1 {
        text-align: center;
    }
</style>