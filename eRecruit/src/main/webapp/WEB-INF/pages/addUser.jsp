<%-- 
    Document   : addUser
    Created on : Jan 4, 2021, 9:40:51 PM
    Author     : popa_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Add User">
    <h1>Add User</h1>
    <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddUser">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="first">First Name</label>
                <input type="text" class="form-control" id="first" name="first" placeholder="" value="" required>
                <div class="invalid-feedback">
                    First Name is required.
                </div>
            </div>
        </div>
       
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="last">Last Name</label>
                <input type="text" class="form-control" id="last" name="last" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Last Name is required.
                </div>
            </div>
        </div>
       
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="phone">Phone Number</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Phone Number is required.
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="mobile">Mobile Number</label>
                <input type="text" class="form-control" id="mobile" name="mobile" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Mobile Number is required.
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Email is required.
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="job">Job Title</label>
                <input type="text" class="form-control" id="job" name="job" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Job Title is required.
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="description">Description</label>
                <input type="text" class="form-control" id="description" name="description" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Description is required.
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="description">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Password is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="GENDIR">General Director</label>
                <input type="checkbox" id="GENDIR" name="roluri" value="GENDIR">
                <label for="DEPDIR">Department Director</label>
                <input type="checkbox" id="GENDIR" name="roluri" value="DEPDIR">
                <label for="HRDIR">HR Director</label>
                <input type="checkbox" id="HRDIR" name="roluri" value="HRDIR">
                <label for="ADMIN">Administrator</label>
                <input type="checkbox" id="ADMIN" name="roluri" value="ADMIN">
                <label for="RECRUIT">Recruiter</label>
                <input type="checkbox" id="RECRUIT" name="roluri" value="RECRUIT">
                <label for="VIEWER">Viewer</label>
                <input type="checkbox" id="VIEWER" name="roluri" value="VIEWER">
                <div class="invalid-feedback">
                    Please select a position.
                </div>
            </div>
        </div>
    
    <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>

    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
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