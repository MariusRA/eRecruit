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
    </form>
</t:pageTemplate>
