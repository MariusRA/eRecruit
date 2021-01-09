<%-- 
    Document   : editPos
    Created on : Jan 8, 2021, 1:56:41 PM
    Author     : Andrei Paul
--%>

<%-- 
    Document   : addPosition
    Created on : Jan 7, 2021, 5:48:14 PM
    Author     : popa_
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Edit Position">
    <h1>Add Position</h1>
    <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/EditPosition">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="" value="${position.name}" required>
                <div class="invalid-feedback">
                    Position name is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="number">Number of people wanted</label>
                <input type="text" class="form-control" id="number" name="number" placeholder="" value="${position.peopleWanted}" required>
                <div class="invalid-feedback">
                    Number of people wanted is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="dep">Department</label>
                <input type="text" class="form-control" id="dep" name="dep" placeholder="" value="${position.department}" required>
                <div class="invalid-feedback">
                    Department is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="project">Project</label>
                <input type="text" class="form-control" id="project" name="project" placeholder="" value="${position.project}" required>
                <div class="invalid-feedback">
                    Project is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="req">Requirements</label>
                <input type="text" class="form-control" id="req" name="req" placeholder="" value="${position.requirements}" required>
                <div class="invalid-feedback">
                    Requirements are required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="respo">Responsibilities</label>
                <input type="text" class="form-control" id="respo" name="respo" placeholder="" value="${position.responsibilities}" required>
                <div class="invalid-feedback">
                    Responsibilities are required.
                </div>
            </div>
        </div>

        <input type="hidden" name="pos_id" value="${position.id}"/>
        <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>
    </form>
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