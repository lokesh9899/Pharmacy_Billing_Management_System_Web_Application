<%-- 
    Document   : employeeMenu
    Created on : 27-Feb-2023, 3:08:12 am
    Author     : lokesh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${Employee == null}">
    <c:redirect url="landingPage.jsp"/>
</c:if>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MedEasy - Employee Home Page</title>
        <link rel="stylesheet" href="css/homeEmployee.css"/>
        <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.13.2/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <script defer src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
        <script defer src="https://cdn.datatables.net/1.13.2/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">
        <!-- Favicons -->
        <link href="images/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    </head>
    <body>
        <jsp:include page="menuEmployee.jsp"></jsp:include>
            <main>
                <div class="card-group">
                    <div id="first" class="card rounded-top border">
                        <div class="card-header rounded-top" style="background-color: #8fddff">
                            <h3 class="text-center mb-2">Customer Details </h3>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="full-input">
                                    <label for="phoneNumber">Phone number:</label>
                                    <input type="tel" id="phoneNumber"  name="phoneNumber" placeholder="Enter phone number" onchange ="FetchCustomer('GetCustomer')" value="${Customer.getPhoneNumber()}" pattern="[126789][0-9]{9}"  required >
                            </div>
                            <div class="full-input">
                                <label for="customerName">Customer Name:</label>
                                <input type="text" id="customerName" name="customerName" placeholder="Enter Customer Name" value="${Customer.getCustomerName()}" required>
                            </div>
                            <div class="full-input">
                                <label for="age">Age:</label>
                                <input type="text" id="age" name="age" placeholder="Enter age" value="${Customer.getAge()}" required >
                            </div>
                            <div class="full-input">
                                <label for="gender">Gender:</label>
                                <select name="gender" class="form-select" id="gender" required>
                                    <option value="" hidden>Select Gender</option>
                                    <option value="Male" <c:if test="${Customer.getGender().equalsIgnoreCase('Male')}">selected</c:if>>Male</option>  
                                    <option value="Female" <c:if test="${Customer.getGender().equalsIgnoreCase('Female')}">selected</c:if>>Female</option>                        
                                </select>
                                    <!--<input type="text" id="gender" name="gender" placeholder="Enter Gender" value="${Customer.getGender()}" required>--> 
                            </div>
                            <div class="full-input">
                                <label for="emailId">Email Id:</label>
                                <input type="email" id="emailId" name="emailId" placeholder="Enter Email address" value="${Customer.getEmailId()}" required> 
                            </div>
                            <div class="full-input">
                                <label for="address">Address:</label>
                                <input type="text" id="address" name="address" placeholder="Enter address"  value="${Customer.getAddress()}" required>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <c:choose>
                            <c:when test="${not empty Customer.getCustomerName()}">
                                <a class="btn btn-success text-white w-25" onclick="SaveCustomer('UpdateCustomer')">Update</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-warning text-black w-25" onclick="SaveCustomer('AddCustomer')">Save</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="card rounded-top" id="second">
                    <div class="card-header rounded-top" style="background-color: #c7eeff">
                        <h3 class="text-center mb-2">Product Details </h3>
                    </div>
                    <div class="card-body">
                        <form>
                            <input type="text" id="employeeName" name="employeeName" value="${Employee.getFirstName()} ${Employee.getLastName()}" hidden required>
                            <div class="full-input">
                                <label for="doctorName">Doctor name:</label>
                                <input type="text" id="doctorName" name="doctorName" placeholder="Enter doctor name" value="${Order.getDoctorName()}" onchange="SaveOrder()" required>
                            </div>

                            <div class="dropdown full-input">
                                <div id="myDropdown" class="dropdown-content">
                                    <input type="text" placeholder="Search Product.." class="full-input m-auto" id="myInput" onkeyup="filterFunction()">
                                    <select id="productNumber" name="productNumber" class="full-input m-auto p-1" required onchange ="getProduct()">
                                        <option value="" hidden>Select product</option>
                                        <c:forEach var="inventory" items="${InventoryList}">
                                            <option value="${inventory.getProductNumber()}" <c:if test="${inventory.getProductNumber()} == ${Product.getProductNumber()}" >selected</c:if>>${inventory.getProductName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <script>
                                function filterFunction() {
                                    var input, filter, ul, li, a, i;
                                    input = document.getElementById("myInput");
                                    filter = input.value.toUpperCase();
                                    div = document.getElementById("myDropdown");
                                    a = div.getElementsByTagName("option");
                                    for (i = 0; i < a.length; i++) {
                                        txtValue = a[i].textContent || a[i].innerText;
                                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                            a[i].style.display = "";
                                        } else {
                                            a[i].style.display = "none";
                                        }
                                    }
                                }
                            </script>

                            <div class="full-input" >
                                <label for="productName">Product Name:</label>
                                <input type="text" style="background-color: #d2d5d6" id="productName" name="productName" value="${Product.getProductName()}" readonly required />
                            </div>
                            <div class="full-input" >
                                <label for="productName">Available Quantity:</label>
                                <input type="text" style="background-color: #d2d5d6" value="${Product.getQuantity()}" readonly required>
                            </div>
                            <div class="full-input">
                                <label for="unitPrice">Unit Price:</label>
                                <input type="text" style="background-color: #d2d5d6" id="unitPrice" name="unitPrice" value="${Product.getUnitPrice()}" readonly required>
                            </div>
                            <div class="full-input">
                                <label for="quantity">Quantity:</label>
                                <input type="number" id="quantity" name="quantity" min = "1" value="1" required >
                            </div>

                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <input type="text" id="orderId" name="orderId" value="${Order.getOrderId()}" hidden required>
                        <c:choose>
                            <c:when test="${not empty Order}">
                                <a class="btn btn-warning text-black" onclick="AddProduct()">Add Product</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-warning text-black disabled">Add Product</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="card rounded-top">
                    <div class="card-header rounded-top" style="background-color: #8fddff">
                        <h3 class="text-center mb-2">Order Summary</h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped table-bordered">
                            <thead class="bg-warning">
                                <tr class="text-center">
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>Unit Price</th>
                                    <th>Price</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="price" scope="page" value="0"/>
                                <c:forEach var="product" items="${ProductList}">
                                    <tr class="text-center">
                                        <td>${product.getProductName()}</td>
                                        <td>${product.getQuantity()}</td>
                                        <td>₹${product.getUnitPrice()}</td>
                                        <td>₹${product.getPrice()}</td>
                                        <td>
                                            <i class="bi bi-x-octagon-fill"  style="cursor: pointer; color: red" onclick="deleteProduct('${product.getProductName()}',${product.getOrderId()})"></i>
                                        </td>
                                        <c:set var="price" scope="page" value="${price+product.getPrice()}"/>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <table>
                            <tr>
                                <th class="pl-2 pt-0">Total Price: </th>
                                <td class="pr-5 pt-0 pl-1">₹ 
                                    <c:out value="${Math.round(price*100.0)/100.0}"/></td>
                                <td class="float-end pl-5 pt-0">
                                    <c:choose>
                                        <c:when test="${not empty ProductList}">
                                            <a class="btn btn-success text-white" href="invoice.jsp" >Generate Invoice</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="btn btn-success text-white disabled " >Generate Invoice</a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/homeEmployee.js"></script>
    </body>
</html>
