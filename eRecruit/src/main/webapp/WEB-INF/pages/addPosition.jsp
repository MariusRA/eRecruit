<%-- 
    Document   : addPosition
    Created on : Jan 7, 2021, 5:48:14 PM
    Author     : popa_
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/position.css"%></style>
<style><%@include file="/general.css"%></style>
<t:pageTemplate pageTitle="Add Position">
    <h1>Add Position</h1>
    <div id="pos_holder">
        <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddPosition">
            <div class="field">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Position name is required.
                </div>
            </div>
            <div class="field">
                <label for="number">Number of people wanted</label>
                <input type="text" class="form-control" id="number" name="number" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Number of people wanted is required.
                </div>
            </div>
            <div class="field">
                <label for="dep">Department</label>
                <input type="text" class="form-control" id="dep" name="dep" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Department is required.
                </div>
            </div>
            <div class="field">
                <label for="project">Project</label>
                <input type="text" class="form-control" id="project" name="project" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Project is required.
                </div>
            </div>
            <div class="field">
                <label for="req">Requirements</label>
                <input type="text" class="form-control" id="req" name="req" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Requirements are required.
                </div>
            </div>
            <div class="field">
                <label for="respo">Responsibilities</label>
                <input type="text" class="form-control" id="respo" name="respo" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Responsibilities are required.
                </div>
            </div>
            <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>
        </form>
    </div>
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict';

            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');

                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</t:pageTemplate>