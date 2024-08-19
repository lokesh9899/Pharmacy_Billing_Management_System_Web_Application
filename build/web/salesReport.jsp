<%-- 
    Document   : salesReport
    Created on : 26-Feb-2023, 7:43:34 pm
    Author     : pavan
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
        <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

        <title>MedEasy - Sales Report</title>
        <!-- Favicons -->
        <link href="images/drugstore.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/dashboard/">

        <!-- Bootstrap core CSS -->
        <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <script defer src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
        <script defer src="https://cdn.datatables.net/1.13.2/js/dataTables.bootstrap5.min.js"></script>
        <script src="js/script.js"></script>

    </head>
    <body>
        <jsp:include page="menuAdmin.jsp"></jsp:include>
            <div id="bodyDiv">
                <div class="container-fluid" >
                    <div class="row" >
                        <div class="navbar navbar-default navbar-static-top col-md-2 d-none rounded ml-2  d-md-block sidebar vh-100" style="position:fixed; background: #1e90ff;width: 230px"> 
                            <div class="sidebar-sticky">
                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link active text-white fw-bold fs-4 mt-1" href="#">
                                            <span class="fs-3" data-feather="home"></span>
                                            Dashboard <span class="sr-only">(current)</span>
                                        </a>
                                    </li>
                                    <li class="nav-item" hidden>
                                        <a class="nav-link text-white fw-bold fs-5 mt-1" href="SalesReport">
                                            <span data-feather="shopping-cart"></span>
                                            Orders
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-white fs-5 mt-1" onclick="getSalesReport()" style="cursor: pointer">
                                            <span data-feather="bar-chart-2"></span>
                                            Daily
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-white fs-5 mt-1" onclick="getMonthlySalesReport()" style="cursor: pointer">
                                            <span data-feather="bar-chart-2"></span>
                                            Monthly
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-white fs-5 mt-1" onclick="getYearlySalesReport()" style="cursor: pointer">
                                            <span data-feather="bar-chart-2"></span>
                                            Yearly
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#customList" style="visibility: hidden">
                                            <span data-feather="file"></span>
                                            Custom List
                                        </a>
                                    </li>
                                    <li class="nav-item" style=" visibility: hidden">
                                        <a class="nav-link" href="#">
                                            <span data-feather="users"></span>
                                            Customers
                                        </a>
                                    </li>
                                    <li class="nav-item" style=" visibility: hidden">

                                        <span data-feather="users"></span>
                                        Customers

                                    </li>

                                    <li class="nav-item" style=" visibility: hidden">
                                        <a class="nav-link" href="#">
                                            <span data-feather="bar-chart-2"></span>
                                            Reports1
                                        </a>
                                    </li>
                                    <li class="nav-item" style=" visibility: hidden">
                                        <a class="nav-link" href="#">
                                            <span data-feather="bar-chart-2"></span>
                                            Reports2
                                        </a>
                                    </li>
                                    <li class="nav-item" style=" visibility: hidden">
                                        <a class="nav-link" href="#">
                                            <span data-feather="bar-chart-2"></span>
                                            Reports
                                        </a>
                                    </li>
                                    <li class="nav-item" style=" visibility: hidden">
                                        <a class="nav-link" href="#">
                                            <span data-feather="bar-chart-2"></span>
                                            Reports
                                        </a>
                                    </li>
                                    <li class="nav-item" style=" visibility: hidden">
                                        <a class="nav-link" href="#">
                                            <span data-feather="bar-chart-2"></span>
                                            Reports
                                        </a>
                                    </li>
                                    <li class="nav-item" style=" visibility: hidden">
                                        <a class="nav-link" href="#">
                                            <span data-feather="bar-chart-2"></span>
                                            Reports
                                        </a>
                                    </li>
                                    <li class="nav-item" style=" visibility: hidden">
                                        <a class="nav-link" href="#">
                                            <span data-feather="bar-chart-2"></span>
                                            Reports
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                            <div class=" pb-2 mb-3 border-bottom">
                                <div class="btn-toolbar mb-2 mb-md-0">
                                    <div class="px-4"></div>
                                    <div class="col-md-3 mb-2 rounded" style="background-color: #c7eeff;border-left:7px solid #1583b3;">
                                        <p class="mb-1" style="font-size: 25px;">Sales Today</p>
                                        <div style="font-size: 35px;">
                                            <svg xmlns="http://www.w3.org/2000/svg" color="green" width="28" height="28" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                            <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4v1.06Z"/>
                                            </svg>${ThisDaySale}K
                                    </div>
                                </div>
                                <div class="px-4"></div>
                                <div class="col-md-3 mb-2 rounded" style="background-color: #c7eeff; border-left:7px solid #1583b3;">

                                    <p class="mb-1" style="font-size: 25px;">Sales This Month</p>
                                    <div style="font-size: 35px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" color="green" width="28" height="28" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                        <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4v1.06Z"/>
                                        </svg>${ThisMonthSale}K
                                    </div>
                                </div>
                                <div class="px-4"></div>
                                <div class="col-md-3 mb-2 rounded" style="background-color: #c7eeff;border-left:7px solid #1583b3;">
                                    <p class="mb-1" style="font-size: 25px;">Sales This Year</p>
                                    <div style="font-size: 35px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" color="green" width="28" height="28" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                        <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4v1.06Z"/>
                                        </svg>${ThisYearSale}K
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="border bg-light rounded p-2 my-2">
                            <canvas class="my-3" id="myChart" width="900" height="380"></canvas>
                        </div>
                        <div class="pb-lg-5 form-row rounded border p-5 m-auto bg-light" style="border-left:5px solid #1583b3;" id="customList">
                            <div class="form-group col-md-2 mx-5">
                                <label for="startDate" class="h4">Start Date</label>
                                <input class="form-control" value="${StartDate}" id="startDate" type="text" name="startDate" placeholder="Start Date" required>
                            </div>
                            <div class="form-group col-md-2 mx-5">
                                <label for="endDate" class="h4">End Date</label>
                                <input class="form-control" value="${EndDate}" id="endDate" type="text" name="endDate" placeholder="End Date" required>
                            </div>
                            <div class="col-auto col-md-3" style="margin-top: 38px;">
                                <button class="btn btn-primary" onclick="getCustomSalesReport()">Submit</button>
                            </div>
                        </div>
                        <div class="p-5 border mt-4 rounded bg-light">
                            <h2>Order List</h2>
                            <table class="table table-striped table-bordered" id="myTable">
                                <thead class="bg-primary text-white">
                                    <tr>
                                        <th>Order Date</th>
                                        <th>Total Price</th>
                                        <th hidden></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${salesOrderList}">   
                                        <tr>
                                            <td>${order.getOrderDateTime()}</td>
                                            <td hidden>${order.getTotalPrice()}</td>
                                            <td>₹${order.getTotalPrice()}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </main>
                </div>
            </div>
            <script src ="js/bootstrap.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
            <script>
                                    $(document).ready(function () {
                                        $('#myTable').DataTable();
                                    });
            </script>    




            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

            <!-- Bootstrap core JavaScript
            ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"></script>
        <script src="../../js/vendor/popper.min.js"></script>
        <script src="../../dist/js/bootstrap.min.js"></script>

        <!-- Icons -->
        <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
        <script>
                                    feather.replace();
        </script>
        <!-- Graphs -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.1/dist/Chart.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js" integrity="sha512-UXumZrZNiOwnTcZSHLOfcTs0aos2MzBWHXOHOuB0J/R44QB0dwY5JgfbvljXcklVf65Gc4El6RjZ+lnwd2az2g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-zoom/2.0.0/chartjs-plugin-zoom.min.js" integrity="sha512-B6F98QATBNaDHSE7uANGo5h0mU6fhKCUD+SPAY7KZDxE8QgZw9rewDtNiu3mbbutYDWOKT3SPYD8qDBpG2QnEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>

                                    function getSalesReport() {
                                        $.ajax({

                                            url: 'SalesReport',
                                            data: {
                                            },
                                                success: function (data) {
                                                $("body").html(data);
                                                }
                                        });
                                    }
                                    function getMonthlySalesReport() {
                                        $.ajax({
                                            url: 'MonthlySalesReport',
                                            data: {
                                            },
                                                success: function (data) {
                                                $("body").html(data);
                                                },
                                            complete: function () {
//                                                setInterval(getMonthlySalesReport, 5000); // The interval set to 5 seconds
                                            }
                                        });
                                    }

                                    function getYearlySalesReport() {
                                        $.ajax({
                                            url: 'YearlySalesReport',
                                            data: {
                                            },
                                                success: function (data) {
                                                $("body").html(data);
                                                }
                                        });
                                    }

                                    function getCustomSalesReport() {
                                        $.ajax({
                                            url: 'CustomSalesReport',
                                            data: {
                                                startDate: $('#startDate').val(),
                                                endDate: $('#endDate').val()
                                            },
                                                success: function (data) {
                                                $("body").html(data);
                                                }
                                        });
                                    }
        </script>
        <script>
                        var ctx = document.getElementById("myChart");
                        var avg = 0;
                        var amount = new Array();
                        var len = $("#myTable tr").length;
                        for (var i = 1; i < len; i++) {
                                amount[i] = document.getElementById("myTable").rows[i].cells[1].innerHTML;
                                avg =   parseFloat(amount[i]) + parseFloat(avg);
                        }
                     avg = parseFloat(avg / (len - 1)).toFixed(2);
//            alert(avg);
                        var avgVal = new Array();
                        var date = new Array();
                        for (var i = 1; i < len; i++) {
                                date[i] = document.getElementById("myTable").rows[i].cells[0].innerHTML;
                                avgVal[i] = avg;
                        }
//            alert(avgVal);
                        var myChart = new Chart(ctx, {
                                type: 'line',
                                data: {
                                        labels: date,
                                        datasets: [{
                            label: 'Sales',
                                                        data: amount,
                                                        lineTension: 0.4,
                                                        backgroundColor: 'transparent',
                                                        borderColor: '#007bff',
                                                        borderWidth: 2.5
//                            pointBackgroundColor: '#007bff'
                                                },
                                                {
                            label: 'Average Sales',
                                                        data: avgVal,
                                                        lineTension: 0.4,
                                                        backgroundColor: 'transparent',
                                                        borderColor: 'red',
                                                        borderWidth: 1,
                                                        borderDash: [10, 5],
                            pointRadius: 0
//                            pointBackgroundColor: '#007bff'
                                                }
                                        ]
                                },
                                options: {
                                        scales: {
                                                yAxes: [{
                                                                ticks: {
                                                                        beginAtZero: true
                                                                }
                                                        }]
                                        },

                                        plugins: {
                        legend: {
                                                    display: true,
                            title: {
                                display: false,
                                text: "Hello World",
                                                         fontColor: "blue",
                                                         fontSize: 15
                            },
                                                     labels: {
                                                         usePointStyle: true
                                                     
                                  }
                                            },
                        zoom: {
                            zoom: {
                                drag: {
                                    enabled: true,
                                    threshold: 100
                                }

                            },
                            pan: {
                                enabled: false,
                                mode: 'x',
                                threshold: 1
                            }
                        }
                    }
                                }
                        });</script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
        <script>
            
            $(document).ready(function() {
                let date = new Date();
                                                let year = date.getFullYear();
                                                let month = date.getMonth() + 1;
                                                let day = date.getDate();
                                                let maxDt = year + "-" + month + "-" + day;
    jQuery("#startDate").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        maxDate: maxDt,
        onClose: function( selectedDate ) {
        jQuery( "#endDate" ).datepicker( "option", "minDate", selectedDate );
        }
    });
    jQuery("#endDate").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        maxDate: maxDt,
        onClose: function( selectedDate ) {
        jQuery( "#startDate" ).datepicker( "option", "maxDate", selectedDate );
        }
    });
});</script>
    </div>
</body>
</html>

