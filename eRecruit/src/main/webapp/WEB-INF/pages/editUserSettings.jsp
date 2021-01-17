<%-- 
    Document   : editUserSettings
    Created on : Jan 16, 2021, 7:58:45 PM
    Author     : Andrei Paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="EditUserSettings">
    <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/EditPosition">
        <a>${com.address}</a>
    </form>
</t:pageTemplate>

