<%-- 
    Document   : userSettings
    Created on : Jan 16, 2021, 2:38:25 PM
    Author     : mariu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/position.css"%></style>
<style><%@include file="/settings.css"%></style>
<t:pageTemplate pageTitle="UserSettings">
    <h1>Settings</h1>
    <div id="pos_holder">
        <form method="POST" action="${pageContext.request.contextPath}/UsersSettings">
            <c:choose>
                <c:when test="${usd.id!=null}"> 
                    <div class="results_holder">
                        <div><a>First Name:</a> <a>${usd.firstName}</a></div>
                        <div><a>Last Name:</a> <a>${usd.lastName}</a></div>
                        <div><a>Phone Number:</a> <a>${usd.phoneNumber}</a></div>                      
                        <div><a>Email:</a> <a>${usd.email}</a></div>
                        <div><a>Address:</a> <a>${usd.address}</a></div>
                        <div><a>Relocation:</a> <a>${usd.relocation}</a></div>
                        <div><a>Link CV:</a> <a>${usd.linkCV}</a></div>
                        <div><a>Interview Date:</a> <a>${usd.interviewDate}</a></div>
                        <div><a>Comments:</a> <a>${usd.comments}</a></div>
                        <div><a class="btn btn-primary" href="${pageContext.request.contextPath}/EditUserSettings?id=${usd.userId}" role="button">Edit</a></div>
                    </div>
                </c:when>
                <c:otherwise>                             

                    <label for="relocation">Do you need relocation?</label>
                    <select class="form-select" name="relocation" aria-label="Default select example">

                        <option selected>Choose an answer </option>
                        <option value="1">Yes</option>
                        <option value="0">No</option>

                    </select>

                    <div class="field">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Your address is required
                        </div>
                    </div>

                    <div class="field">
                        <label for="cv">Your CV</label>
                        <input type="url" class="form-control" id="cv" name="cv" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            CV is required
                        </div>
                    </div>

                    <button class="btn btn-primary btn-lg btn-block" name="settingsSave" type="submit">Save</button>
                </form>

            </c:otherwise>    
        </c:choose>  
    </form>
</div>


</t:pageTemplate>