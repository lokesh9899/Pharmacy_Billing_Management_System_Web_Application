<%-- 
    Document   : inventory
    Created on : 24-Feb-2023, 12:24:18 pm
    Author     : pavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not (Admin != null or Employee != null)}">
<c:redirect url="landingPage.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MedEasy - Inventory</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Favicons -->
        <link href="images/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

         <!--Bootstrap core CSS--> 
        <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">

         <!--Custom styles for this template--> 
        <!--<link href="css/carousel.css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <style>
            #example_wrapper{
                width: 100%;
                display: block;
                margin: auto;
            }
        </style>
    </head>
    <body>
        <c:choose>
        <c:when test="${not empty Admin}">
            <jsp:include page="menuAdmin.jsp"></jsp:include>
        </c:when>
        <c:when test="${not empty Employee}">
            <jsp:include page="menuEmployee.jsp"></jsp:include>
        </c:when>
        </c:choose>
        <main>
            <div class="text-center">
                <a class="btn btn-primary p-2 fw-bold fs-5" style="width:200px" href="addProduct.jsp" title="Add Product">Add Product&nbsp; <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bag-plus" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 7.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0v-1.5H6a.5.5 0 0 1 0-1h1.5V8a.5.5 0 0 1 .5-.5z"/><path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/></svg></a>
            </div>
            <div class="container">
                <table class="table table-bordered table-striped" id="inventoryTable">
                    <thead class="bg-info">
                        <c:if test="${not empty AddedMsg}">
                            <c:out value="${AddedMsg}"/>
                        </c:if>
                        <tr>
                            <th>Product No</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Unit Price</th>
                            <th>Expiry Date</th>
                            <th>Shelf Number</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${InventoryList}">   
                            <tr>

                                <td>${product.getProductNumber()}</td>
                                <td>${product.getProductName()}</td>
                                <td>${product.getQuantity()}</td>
                                <td>₹${product.getUnitPrice()}</td>
                                <td>${product.getExpiryDate()}</td>
                                <td>${product.getShelfNumber()}</td>
                                <td class="text-center">
                                    <a href="EditProduct?productNumber=${product.getProductNumber()}" class=" text-decoration-none">
                                        <button class="w-20 btn btn-sm btn-info text-center"><i class="bi bi-pencil-square"></i></button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <script src =  "js/bootstrap.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('#inventoryTable').DataTable();
                });
            </script>
        </main>
    </body>
</html>
