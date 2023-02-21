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
                                        Count Number of User by Status
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-area me-1"></i>
                                    Number of Role
                                </div>
                                <div class="card-body"><canvas id="roleChart" width="100%" height="30"></canvas></div>
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

        <!--        <script src="assets/demo/chart-area-demo.js"></script>
                <script src="assets/demo/chart-bar-demo.js"></script>-->
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
            var xValues = ["Active", "Locked"];
            var yValues = [${requestScope.active}, ${requestScope.locked}];
            var barColors = [
                "#b91d47",
                "#00aba9"

            ];

            new Chart('myPieChart', {
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
                        text: 'Count Number of User by Status'
                    }
                }
            });
        </script>

        <script>
            var xValues = ["Admin", "Seller", "Marketing", "Customer"];
            var yValues = [${requestScope.admin}, ${requestScope.seller}, ${requestScope.marketing}, ${requestScope.customer}];
            var barColors = ["red", "green", "blue", "orange"];

            new Chart('roleChart', {
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
                        text: 'Count Number of User by Role'
                    }
                }
            });
        </script>
 

    </body>
</html>
