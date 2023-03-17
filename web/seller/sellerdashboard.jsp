<%-- 
    Document   : sellerDashboard
    Created on : Mar 6, 2023, 1:56:05 PM
    Author     : Trang
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
        <title>Seller Dashboard</title>
        <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://kit.fontawesome.com/d846362117.css" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="sb-nav-fixed">
         <jsp:include page="../nav.jsp"/>

        <div id="layoutSidenav">
             <jsp:include page="../sidenav.jsp"/>


            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Seller Dashboard</h1>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Total Number of Product</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h4>${requestScope.total} products</h4>                                         
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
                                    <div class="card-body">Total Income</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h4>${requestScope.sum} $</h4>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Best Seller Product
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                </div>
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
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="js/scripts.js"></script>

        </div>