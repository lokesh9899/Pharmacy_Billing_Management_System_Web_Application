<%-- 
    Document   : menuEmployee
    Created on : 02-Mar-2023, 2:53:12 pm
    Author     : chandhu
--%>
<link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-primary sticky-top py-2 mb-2" style="color: white;background: #1E90FF;">
    <div class="container-fluid">
        <a class="mx-4" title="pharmacy icons"><img src="images/drugstore.png" width="40" alt="alt"/></a>
        <a class="navbar-brand text-white" href="#">MedEasy</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse m-auto" id="navbarScroll">
            <ul class="navbar-nav me-auto my-4 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                    <a class="nav-link active text-warning" aria-current="page" href="homeEmployee.jsp"> Home </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light" href="GetAllInventory">Inventory</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light" href="GetAllOrder">Order History</a>
                </li>
            </ul>
            <div class="nav-item dropdown ">
                <a class="nav-link dropdown-item" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="images/profile.png" width="40" height="40" class="rounded-circle" alt="...">
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarScrollingDropdown">
                    <li><a class="dropdown-item">Welcome,</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><h4 class="dropdown-item">${Employee.getFirstName()} ${Employee.getLastName()} </h4></li>
                    <!--<li><hr class="dropdown-divider"></li>-->
                    <li><a class="dropdown-item pt-2" href="#"><img src="images/email.png" style="padding-right: 5px" width="30" height="30" alt="...">${Employee.getEmailId()}</a></li>
                    <!--<li><hr class="dropdown-divider"></li>-->
                    <li><a class="dropdown-item pt-2" href="Logout"><img src="images/logout.png" style="padding-right: 5px" width="30" height="30" alt="...">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
