<%-- 
    Document   : homeAdmin
    Created on : 21-Feb-2023, 2:02:03 pm
    Author     : Lokesh Reddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:if test="${Admin == null}">
<c:redirect url="landingPage.jsp"/>
</c:if>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>MEDEASY - Admin Home</title>

        <!-- Favicons -->
        <link href="images/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Bootstrap core CSS -->
        <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>

        <link rel="stylesheet" href="css/homeAdmin.css">
        
    </head>

    <body class="text-center" style=" background-image:url(images/bgMain.png);  background-repeat: no-repeat;
    height: 100vh; background-position: center; background-size: cover;">
        <jsp:include page="menuAdmin.jsp"></jsp:include>

        <main id="changeableArea">
            <div class="quote register-left">
                <img src="images/signup-logo.png" alt="xx"/>
                <h1 class="new">Welcome to</h1>
                <h1 class="title">MedEasy</h1>
            </div>
       </main>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="../../assets/js/vendor/popper.min.js"></script>
        <script src="../../dist/js/bootstrap.min.js"></script>
    </body>
</html>
