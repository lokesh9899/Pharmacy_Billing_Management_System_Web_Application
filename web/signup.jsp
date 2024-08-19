<%-- 
    Document   : signup
    Created on : 23-Feb-2023, 1:20:34 pm
    Author     : chandhu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MEDEASY - Sign Up</title>
        <!-- Favicons -->
        <link href="images/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <link rel="stylesheet" href="css/signupStyle.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>


    <body>
        <div class="container register">
            <div class="row">
                <div class="col-md-3 register-left">
                    <img src="images/clipart1192900.png" alt="xx"/>
                    <h3>Welcome</h3>
                    <p>You are now a member of MedEasy family!</p>
                    <!--<a href="">Login</a><br/>-->
                    <c:if test="${not empty CreatedMsg}">
                        <div class="alert alert-info alert-dismissible fade show w-100 p-3 text-center" role="alert">
                            <c:out value="${CreatedMsg}"/>
                            <c:remove var="CreatedMsg" scope="session" />
                            <% response.setHeader("Refresh", "5;url=landingPage.jsp");%>
                            <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                        </div>
                    </c:if>
                </div>
                <div class="col-md-9 register-right">                    
                    <div class="tab-content" id="myTabContent">
                        <form action="SignUp" method="POST">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Apply as an Employee</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <input type="text" name="firstName" class="form-control" placeholder="First Name *" minlength="3" required/>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <input type="text" name="lastName" class="form-control" placeholder="Last Name *" minlength="3" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" minlength="8" class="form-control" id="password" placeholder="Password *" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,16}$" title="Must contain at least one number,one uppercase,one lowercase letter,a symbol and at least 8 or more characters" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" minlength="8" id="confirm_password" placeholder="Confirm Password *" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="number" name="pincode" onchange="getCity()" id="pincode" class="form-control" placeholder="Pincode *" required/>
                                        </div>
                                        <div class="form-group">
                                            <select name="qualification" class="form-control" id="qualification" required>
                                                <option value="" hidden>Select Highest Qualification*</option>
                                                <option value="10th Grade">10th Grade</option>  
                                                <option value="12th Grade">12th Grade </option>
                                                <option value="Diploma">Diploma</option>
                                                <option value="Graduate">Graduate</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <div class="maxl">
                                                Gender: 
                                                <div class="form-check form-check-inline mb-0 me-4">
                                                    <input class="form-check-input" name="gender" type="radio" id="femaleGender" value="Female" required>
                                                    <label class="form-check-label" for="femaleGender">Female</label>
                                                </div>

                                                <div class="form-check form-check-inline mb-0 me-4">
                                                    <input class="form-check-input" name="gender" type="radio" id="maleGender" value="Male" required>
                                                    <label class="form-check-label" for="maleGender">Male</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" name="emailId" class="form-control" placeholder="Your Email *" value="" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="phoneNumber" minlength="10" maxlength="10" class="form-control" placeholder="Your Phone *" pattern="[6789][0-9]{9}" required/>
                                        </div>

                                        <div class="form-group">
                                            <!--<input type="text" name="dob" class="form-control"  placeholder="DOB (YYYY-MM-DD) *" value="" required/>-->
                                            <input type="text" name="dob" id="dob" class="form-control datepicker"  placeholder="Date of Birth *" style="display: block;
                                                   width: 100%;
                                                   padding: 0.375rem 0.75rem;
                                                   font-size: 1rem;
                                                   line-height: 1.5;
                                                   color: #495057;
                                                   background-color: #fff;
                                                   background-clip: padding-box;
                                                   border: 1px solid #ced4da;
                                                   border-radius: 0.25rem;
                                                   transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out" required/>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <input type="text" name="state" id="state" class="form-control" placeholder="State *" value="" style="text-transform: capitalize;" required />
                                            </div>
                                            <div class="form-group col-md-6">
                                                <input type="text" name="city" id="city" class="form-control" placeholder="City *" style="text-transform: capitalize;" value="" required/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <input type="text" name="aadharNo" minlength="12" pattern="^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$" class="form-control" placeholder="Aadhar Number *" required/>
                                        </div>

                                        <!--<input type="submit" class="btnRegister"  value="Register"/>-->
                                        <button type="submit" class="btnRegister pure-button pure-button-primary">Register</button>
                                        <a class="btnRegister pure-button btn-danger text-center" style="margin-top: 10px ;text-decoration: none" href="landingPage.jsp">Cancel</a>

                                        <!--<input type="submit" class="btnRegister"  value="Register"/>-->

                                        <!--<div class="text-center text-muted text-uppercase mb-3">OR</div>-->

                                        <!--                                        <a href="#" class="btn btn-light login_with w-auto">
                                                                                    <img src="images/google-icon.png" alt="G" class="img-fluid me-4">Continue with Google
                                                                                </a>-->
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
        <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js"></script>
        <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" /> 
        <script>
                                                let date = new Date();
                                                let year = date.getFullYear() - 18;
                                                let month = date.getMonth() + 1;
                                                let day = date.getDate();
                                                let maxDt = year + "-" + month + "-" + day;
                                                $('#dob').datepicker({format: 'yyyy-mm-dd', maxDate: maxDt});

        </script>
        <script src="js/validatePassword/validatePassword.js"></script>
        <script>
                                                function getCity() {

                                                    let pincode = document.getElementById("pincode").value;
                                                    const url = `https://api.postalpincode.in/pincode/` + pincode;
                                                    let state = document.getElementById("state");
                                                    let city = document.getElementById("city");
                                                    fetch(url)
                                                            .then(response => response.json())
                                                            .then(data => {
                                                                console.log(data);
                                                                state.value = data[0].PostOffice[0].State;
                                                                city.value = data[0].PostOffice[0].District;

                                                                console.log(`The pincode ${pincode} is located in ${city}, ${state}.`);
                                                            })
                                                            .catch(error => alert("Please Enter Correct Pincode", error));
                                                }
        </script>
    </body>


</html>
