<%-- 
    Document   : orderMedicine
    Created on : 21-Feb-2023, 11:20:26 pm
    Author     : lokesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Medicine Order System</title>
    <link rel="stylesheet" href="css/orderMedicine.css" />
    <script src="https://kit.fontawesome.com/ee5fe365d2.js" crossorigin="anonymous"></script>
  </head>
  <body>
    
    <div class="container">
        <h1>Order Medicine <i class="fa-solid fa-syringe"></i> </h1>

      <form id="order-form">
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" required />
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" required />
      </div>
      <div class="form-group">
        <label for="address">Address:</label>
        <textarea id="address" required></textarea>
      </div>
      <div class="form-group">
        <label for="medicine">Medicine:</label>
        <select id="medicine" required>
          <option value="" disabled selected>Select a medicine</option>
          <option value="medicine1">Medicine 1</option>
          <option value="medicine2">Medicine 2</option>
          <option value="medicine3">Medicine 3</option>
        </select>
      </div>
      <div class="form-group">
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" min="1" required />
      </div>
         <button class="add" type="button" id="add-medicine">Add Medicine</button>
      <div class="buttons">
         
      <div id="medicines-container"></div>
      
<!--      <button type="submit" id="print">Print</button>-->
      </div>
         <div class="submit"><button type="submit" id="submit-order">Submit Order</button></div>
         
    </form>
    </div>
    
    <script src="js/orderMedicine.js"></script>
  </body>
</html>
