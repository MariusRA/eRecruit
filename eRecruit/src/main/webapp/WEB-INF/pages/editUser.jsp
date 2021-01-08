<%-- 
    Document   : editcar
    Created on : Jan 6, 2021, 8:06:51 PM
    Author     : Andrei Paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="EditUser">
    <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/EditUser">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="first">First Name</label>
                <input type="text" class="form-control" id="first" name="first" placeholder="" value="${user.lastName}" required>
                <div class="invalid-feedback">
                    First Name is required.
                </div>
            </div>
        </div>
       
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="last">Last Name</label>
                <input type="text" class="form-control" id="last" name="last" placeholder="" value="${user.firstName}" required>
                <div class="invalid-feedback">
                    Last Name is required.
                </div>
            </div>
        </div>
       
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="phone">Phone Number</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="" value="${user.phoneNumber}" required>
                <div class="invalid-feedback">
                    Phone Number is required.
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="mobile">Mobile Number</label>
                <input type="text" class="form-control" id="mobile" name="mobile" placeholder="" value="${user.mobilePhoneNumber}" required>
                <div class="invalid-feedback">
                    Mobile Number is required.
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control needs-validation" id="email" name="email" placeholder="" value="${user.email}" required>
                <div class="invalid-feedback">
                    Email is required.
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="job">Job Title</label>
                <input type="text" class="form-control" id="job" name="job" placeholder="" value="${user.jobTitle}" required>
                <div class="invalid-feedback">
                    Job Title is required.
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="description">Description</label>
                <input type="text" class="form-control" id="description" name="description" placeholder="" value="${user.description}" required>
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

      <select class="form-select" name="roles" aria-label="Default select example">
                 <option selected>Choose a Role </option>
                 <option value="GENERAL DIRECTOR">General Director</option>
                 <option value="DEPARTMENT DIRECTOR">Department Director</option>
                 <option value="HR DIRECTOR">HR Director</option>
                 <option value="ADMINISTRATOR">Administrator</option>
                 <option value="RECRUITER">Recruiter</option>
                 <option value="VIEWER">Viewer</option>
       </select>
                
    <input type="hidden" name="user_id" value="${user.id}"/>
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