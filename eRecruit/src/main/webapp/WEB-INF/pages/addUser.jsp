
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
    <form class=""  method="POST" action="${pageContext.request.contextPath}/AddUser">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="first">First Name</label>
                <input type="text" class="form-control" id="first" name="first" placeholder="" value="" required>
                <div class="invalid-feedback hidden">
                    First Name is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="last">Last Name</label>
                <input type="text" class="form-control" id="last" name="last" placeholder="" value="" required>
                <div class="invalid-feedback hidden">
                    Last Name is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="phone">Phone Number</label>
                <select name="country" id="country" onclick="selectCountry()">
                    <option value="-1" selected>choose your country prefix</option>
                    <option value="1">RO</option>
                    <option value="2">DE</option>
                </select>
                <input onclick="validationPhone()" type="text" class="form-control hidden" id="ro_phone" name="phone" placeholder="" value="+40" required>
                <input type="text" class="form-control hidden" id="de_phone" name="phone_de" placeholder="" value="49" required>
                <div id="phone_error" class="hidden">
                    Phone Number is required.
                </div>
            </div>
        </div>
        
        <script>
            function selectCountry() {
                var country_value = document.getElementById("country").value;
                var ro = document.getElementById("ro_phone"); 
                var de = document.getElementById("de_phone"); 
               /* var rov = document.getElementById("ro_phone").value; 
                var dev = document.getElementById("de_phone").value;
                patt = /^(?:(?:(?:00\s?|\+)40\s?|0)(?:7\d{2}\s?\d{3}\s?\d{3}|(21|31)\d{1}\s?\d{3}\s?\d{3}|((2|3)[3-7]\d{1})\s?\d{3}\s?\d{3}|(8|9)0\d{1}\s?\d{3}\s?\d{3}))$/; 
                //patt.test(ro);
                
                //var phone_error = document.getElementsByClassName("phone_error");
                if(patt.test(rov) == false) {
                    var phone_error = document.getElementById("phone_error"); console.log('aa');
                    phone_error.classList.remove("hidden");
                    phone_error.classList.add("show");
                } else {
                    var phone_error = document.getElementById("phone_error");console.log('bb');
                    phone_error.classList.add("hidden");
                    phone_error.classList.remove("show");
                }*/
                if(country_value == 1) {
                    //ro.addClass('hidden');
                    ro.classList.remove("hidden");
                    de.classList.add("hidden");
                } else if (country_value == 2) {
                    de.classList.remove('hidden');
                    ro.classList.add("hidden");
                } else {
                    ro.classList.add("hidden");
                    de.classList.add("hidden");
                }
            }
            
            function validationPhone() {
                var rov = document.getElementById("ro_phone").value; 
                var dev = document.getElementById("de_phone").value;
                patt = /^(?:(?:(?:00\s?|\+)40\s?|0)(?:7\d{2}\s?\d{3}\s?\d{3}|(21|31)\d{1}\s?\d{3}\s?\d{3}|((2|3)[3-7]\d{1})\s?\d{3}\s?\d{3}|(8|9)0\d{1}\s?\d{3}\s?\d{3}))$/; 
                //patt.test(ro);
                
                //var phone_error = document.getElementsByClassName("phone_error");
                if(patt.test(rov) == false) {
                    var phone_error = document.getElementById("phone_error"); console.log('aa');
                    phone_error.classList.remove("hidden");
                    phone_error.classList.add("show");
                } else {
                    var phone_error = document.getElementById("phone_error");console.log('bb');
                    phone_error.classList.add("hidden");
                    phone_error.classList.remove("show");
                }
            }
        </script>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="mobile">Mobile Number</label>
                <input type="text" class="form-control" id="mobile" name="mobile" placeholder="" value="" required>
                <div class="invalid-feedback hidden">
                    Mobile Number is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control needs-validation" id="email" name="email" placeholder="" value="" required>
                <div class="invalid-feedback hidden">
                    Email is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="job">Job Title</label>
                <input type="text" class="form-control" id="job" name="job" placeholder="" value="" required>
                <div class="invalid-feedback hidden">
                    Job Title is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="description">Description</label>
                <input type="text" class="form-control" id="description" name="description" placeholder="" value="" required>
                <div class="invalid-feedback hidden">
                    Description is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="description">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="" value="" required>
                <div class="invalid-feedback hidden">
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

        <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>
    </form>
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        /*(function () {
            'use strict';

            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                //var phone_inputs = document.getElementById("");
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
        })();*/
    </script>
    <style>
        .hidden {
            display: none !important;
        }
        .show,
        .invalid-feedback {
            display: block;
        }

    </style>

</t:pageTemplate>