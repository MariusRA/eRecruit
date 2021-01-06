<%-- 
    Document   : menu
    Created on : Jan 4, 2021, 1:46:43 PM
    Author     : eli10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="${pageContext.request.contextPath}">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/about.jsp">About us</a>
                </li>
                <li class="nav-item ${activePage eq "Users" ? ' active' : ''}">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Users">Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Apply</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item ${activePage eq "Login" ? ' active' : ''}">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Login">Login</a>
                </li>
            </ul>
        </div>
    </nav>
<c:if test="${activePage ne ('Login')}">
    
    <div class="title-holder"> 
        <span>e-Recruit</span>
    </div>

    <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" data-interval="4000">
                <img src="${pageContext.request.contextPath}/carousel/2522.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-interval="4000">
                <img src="${pageContext.request.contextPath}/carousel/19341.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</c:if>

<style>
    .carousel-inner, 
    .carousel-item img {
        height: 550px;
    }

    .carousel-item img {
        position: relative;
        margin: 0 auto;
        opacity: 31.3%;
    }
    .title-holder {
        text-align: center;
        width: 100%;
        margin: 60px 0;
        position: absolute;
        font-size: 100px;
        z-index: 1;
        top: 200px;
    }
    .title-holder span {
        background-color: #ffffff;
        padding: 10px 50px;
        border-radius: 10px;
        color: #5C4634;
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
