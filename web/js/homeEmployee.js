/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function deleteProduct(ProductName,OrderId) {
//    alert('Fetch');
    $.ajax({
        url: 'RemoveProduct',
        type: 'POST',
        data: {
            'productName': ProductName, 'orderId': OrderId
        },
        success: function (responseText) {
            $("#first").load(responseText);
            location.reload();
        }
    });
}
function FetchCustomer(method) {
    //alert('Fetch');
    $.ajax({
        url: method,
        type: 'POST',
        data: {
            'phoneNumber': $("#phoneNumber").val()
        },
        success: function (responseText) {
            $("#first").load(responseText);
            location.reload();
        }
    });
}
function SaveCustomer(method) {
    //alert("AddCustomer");
    $.ajax({
        url: method,
        type: 'post',
        data: {
            'phoneNumber': $("#phoneNumber").val(),
            'customerName': $("#customerName").val(),
            'age': $("#age").val(),
            'gender': $("#gender").val(),
            'emailId': $("#emailId").val(),
            'address': $("#address").val()
        },
        success: function () {
            //alert("responseText");
            //$("").load(responseText);
            location.reload();
        }
    });
}
function SaveOrder() {
    //alert("Saveorder");
    $.ajax({
        url: 'AddOrder',
        type: 'POST',
        data: {
            'phoneNumber': $("#phoneNumber").val(),
            'customerName': $("#customerName").val(),
            'address': $("#address").val(),
            'doctorName': $("#doctorName").val(),
            'employeeName': $("#employeeName").val()
        },
        success: function (responseText) {
            //alert(responseText);
            //$("#second").load(responseText);
            location.reload();
        }
    });
}
function getProduct() {
    //alert($("#productNumber").val());
    $.ajax({
        url: 'GetProduct',
        type: 'post',
        data: {
            'productNumber': $("#productNumber").val()
        },
        success: function (responseText) {
            //alert(responseText);
            $("#second").load(responseText);
            location.reload();
        }
    });
}
function AddProduct() {
    //alert("SaveCustomer");
    $.ajax({
        url: 'AddProduct',
        type: 'POST',
        data: {
            'productName': $("#productName").val(),
            'quantity': $("#quantity").val(),
            'unitPrice': $("#unitPrice").val(),
            'orderId': $("#orderId").val()
        },
        success: function (responseText) {
           // alert(responseText);
//                                                    $("#second").load(responseText);
            location.reload();
        }
    });
}