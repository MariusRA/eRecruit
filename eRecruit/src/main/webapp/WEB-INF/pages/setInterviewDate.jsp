<%-- 
    Document   : setInterviewDate
    Created on : Jan 17, 2021, 12:12:36 PM
    Author     : popa_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/user.css"%></style>
<style><%@include file="/position.css"%></style>

<t:pageTemplate pageTitle="Set Interview">
    
    <div id="pos_holder">
        <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddUser">
            
            <div class="field">
                <label for="interview">Set an interview date</label>
                <input type="text" class="form-control" id="interview" name="interview" placeholder="" value="" required>
                <div class="invalid-feedback">
                    The interview date is required.
                </div>
            </div>
            

            <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>
        </form>
    </div>
    

</t:pageTemplate>