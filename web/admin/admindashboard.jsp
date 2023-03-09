<%-- 
    Document   : userList
    Created on : Jan 28, 2023, 1:10:32 AM
    Author     : ducth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin Dashboard</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://kit.fontawesome.com/d846362117.css" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="#"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form action="user?action=search" method="post" class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">


            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i>Hello ${sessionScope.user.userName} </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">My Profile</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="admin">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Admin Dashboard
                            </a>
                            <a class="nav-link" href="user">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                Manager Users
                            </a>

                        </div>
                    </div>

                </nav>
            </div>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Admin Dashboard</h1>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Total Number of Customers</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3>${requestScope.countUser} users</h3>
                                         
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Total Number of Product</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3>${requestScope.product} products</h3>                                         
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Total Number of Orders</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3>${requestScope.order} orders</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Most Ordered Product</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h4>${most.product.productName}(${most.order.id})</h4>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Number of User by Gender
                                    </div>
                                    <div class="card-body"><canvas id="mychart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Top 3 Most Orders Product
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                        </div>
                                    
                              <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Top 3 Users have the most order
                                    </div>
                                    <div class="card-body"><canvas id="countUserOrder" width="100%" height="30"></canvas></div>
                                </div>
                            </div>      

                         




                    </div>

                </main>
                <footer class="py-4 bg-light mt-auto">

                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted"></div>

                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>

        
        <script>
            var xValues = ["Male", "Female"];
            var yValues = [${requestScope.male}, ${requestScope.female}];
            var barColors = [
                "#b91d47",
                "#00aba9"

            ];

            new Chart('mychart', {
                type: 'pie',
                data: {
                    labels: xValues,
                    datasets: [{
                            backgroundColor: barColors,
                            data: yValues
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: 'Number of User by Gender'
                    }
                }
            });
        </script>

 
        
        <script>
            const dataPie = {
            labels: [
            <c:forEach items="${listSell}" var="x">
            "${x.product.productName}",
            </c:forEach>
            ],
                    datasets: [{
                    label: "My First Dataset",
                            data: [
            <c:forEach items="${listSell}" var="x">
                            "${x.order.id}",
            </c:forEach>
                            ],
                            backgroundColor: [
                                    "rgb(255, 0, 0)",
                                    "rgb(54, 162, 235)",
                                    "rgb(255, 205, 86)"
                            ],
                            hoverOffset: 4
                    }]
            };
            const configPie = {
            type: "pie",
                    data: dataPie,
            };
            const myPieChart = new Chart(
                    document.getElementById("myPieChart"),
                    configPie
                    );
        </script>
        
        <script>
            const dataBar = {
            labels: [
            <c:forEach items="${orders}" var="od">
            "${od.user.userName}",
            </c:forEach>
            ],
                    datasets: [{
                    label: "My First Dataset",
                            data: [
            <c:forEach items="${orders}" var="od">
                            "${od.totalPrice}",
            </c:forEach>
                            ],
                            backgroundColor: [
                                    "rgb(255, 0, 0)",
                                    "rgb(0, 63, 127)",
                                    "rgb(255, 205, 86)"
                            ],
                            hoverOffset: 4
                    }]
            };
            const configBar = {
            type: "pie",
                    data: dataBar,
            };
            const myBarChart = new Chart(
                    document.getElementById("countUserOrder"),
                    configBar
                    );
        </script>


        
 

    </body>
</html>
