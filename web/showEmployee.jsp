<%-- 
    Document   : showEmployee
    Created on : 21-Feb-2023, 12:35:53 pm
    Author     : lokes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:if test="${Admin == null}">
    <c:redirect url="landingPage.jsp"/>
</c:if>

<!doctype html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MedEasy - Verified Employee</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Favicons -->
        <link href="images/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/carousel/">

        <!-- Bootstrap core CSS -->
        <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <!--<link href="css/carousel.css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    </head>
    <body>
        <jsp:include page="menuAdmin.jsp"></jsp:include>
            <main>
                <div class="container p-0 m-auto" style="display: block;">
                    <table class="table table-bordered table-striped table-responsive" id="example"><!--container  row justify-content-center-->
                        <thead class="bg-info">
                            <tr>
                                <th>Emp. Id</th>
                                <th>Aadhar No</th>
                                <th>Email Id</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>City</th>
                                <th>State</th>
                                <th>Pin Code</th>
                                <th>Gender</th>
                                <th>Phone Number</th>
                                <th>Date_Of_Birth</th>
                                <th>Degree</th>
                                <th>Salary</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty EmpMsg}">
                            <c:out value="${EmpMsg}"/>
                        </c:if>
                        <c:forEach var="emp" items="${VerifiedEmpList}">   
                            <tr>

                                <td>${emp.getEmployeeId()}</td>
                                <td>${emp.getAadharNo()}</td>
                                <td>${emp.getEmailId()}</td>
                                <td>${emp.getFirstName()}</td>
                                <td>${emp.getLastName()}</td>
                                <td>${emp.getCity()}</td>
                                <td>${emp.getState()}</td>
                                <td>${emp.getPincode()}</td>
                                <td>${emp.getGender()}</td>
                                <td>${emp.getPhoneNumber()}</td>
                                <td>${emp.getDob()}</td>
                                <td>${emp.getQualification()}</td>
                                <td>₹${emp.getSalary()}</td>
                                <td class="text-center">
                                    <a href="EditEmployee?employeeId=${emp.getEmployeeId()}" class=" text-decoration-none" title="edit">
                                        <button class=" btn-sm btn-info text-center"><i class="bi bi-pencil-square"></i></button>
                                    </a>
                                </td>
                                <td class="text-center">
                                    <a onclick="deleteEmployee(${emp.getEmployeeId()})" class=" text-danger" title="delete">
                                        <button class=" btn-sm btn-danger text-center"><i class="bi bi-trash"></i></button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <script src ="js/bootstrap.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
            <script>
                                        $(document).ready(function () {
                                            $('#example').DataTable();
                                        });
            </script>
            <script>
                function deleteEmployee(employeeId) {
                    const result = confirm("Are you sure you want to delete?");
                    if (result) {
                        $.ajax({
                            url: 'DeleteEmployee',
                            type: 'POST',
                            data: {
                                'employeeId': employeeId
                            },
                            success: function () {
                                alert("Employee Deleted Successfully");
                                location.reload();
                            }
                        });
                    }
                }
            </script>
        </main>
    </body>
</html>
