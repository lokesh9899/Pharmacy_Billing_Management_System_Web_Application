<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">


        <!--done-->
        <link rel="stylesheet" href="css/carousel.min.css"> 
        <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.login.css">

        <!-- Favicons -->
        <link href="images/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>-->

        <!-- Style -->
        <link rel="stylesheet" href="css/edit.css">

        <title>MedEasy - Edit Product</title>
    </head>
    <body>
        <div class="d-md-flex half">
            <div class="bg" style="background-image: url('images/editMedicine2.jpg');"></div>
            <div class="contents">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-12">
                            <div class="form-block mx-auto my-1">
                                <div class="text-center mb-3">
                                    <h3 class="text-uppercase">EDIT PRODUCT DETAILS</h3>
                                </div>
                                <form action="UpdateProduct" method="POST">
                                    <div class="form-group first">
                                        <label for="productId">Product Number</label>
                                        <input type="text" class="form-control" placeholder="Product Number" name="productNumber" value="${Product.getProductNumber()}" readonly>
                                    </div>

                                    <div class="form-group last mb-2">
                                        <label for="productName">Product Name</label>
                                        <input type="text" class="form-control" placeholder="Product Name" style="text-transform: capitalize;" name="productName" value="${Product.getProductName()}" required>
                                    </div>   
                                    <div class="form-group last mb-2">
                                        <label for="quantity">Quantity</label>
                                        <input type="text" class="form-control" placeholder="Quantity" name="quantity" value="${Product.getQuantity()}" required>
                                    </div> 
                                    <div class="form-group last mb-2">
                                        <label for="unitPrice">Price</label>
                                        <input type="text" class="form-control" placeholder="Price" name="unitPrice" value="${Product.getUnitPrice()}">
                                    </div> 
                                    <div class="form-group last mb-2">
                                        <label for="expiryDate">Expiry Date</label>
                                        <input type="date" class="form-control" name="expiryDate" value= "${Product.getExpiryDate()}" >
                                    </div> 
                                    <div class="form-group last mb-2">
                                        <label for="shelfNumber">Shelf Number</label>
                                        <input type="text" class="form-control" placeholder="Shelf Number" name="shelfNumber" style="text-transform: capitalize;" value="${Product.getShelfNumber()}">
                                    </div> 
                                    <button type="submit" value="Save" class="btn btn-block py-2 btn-primary">SAVE</button>
                                    <a class="btn btn-danger text-white py-2 btn-primary w-100 mt-2" href="inventory.jsp">CANCEL</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>