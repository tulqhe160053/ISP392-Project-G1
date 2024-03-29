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
        <title>Marketing Dashboard</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://kit.fontawesome.com/d846362117.css" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body class="sb-nav-fixed">
         <jsp:include page="../nav.jsp"/>
        <div id="layoutSidenav">
             <jsp:include page="../sidenav.jsp"/>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Marketing Dashboard</h1>
                        <div class="row col-md-12 mt-4">
                            <div class="col-md-3">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Total Number of Slider</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3 class="text-white">${slider} sliders</h3>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Average Star Of Product Feedback</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3 class="text-white">${avgstar}<i class="fa-solid fa-star"></i></h3>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">The most voted products with 5<i class="fa-solid fa-star"></i></div>
                                    <div class="card-footer d-flex align-items-center justify-content-start">
                                        <h5 class="text-white">${product5star.product.productName}(${product5star.star} times)</h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Total Number of Blog</div>
                                    <div class="card-footer d-flex align-items-center justify-content-start">
                                        <h4 class="text-white">${countBlog} blogs</h4>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Number of Blog by Category
                                    </div>
                                    <div class="card-body"><canvas id="mychart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Top 3 Products with highest average star
                                    </div>
                                    <div class="card-body"><canvas id="myPFeedback" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-7">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Count Star of Feedback
                                    </div>
                                    <div class="card-body"id="myStarchart" width="100%" height="50"></div>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Top 3 Users with the most feedback
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50%"></canvas></div>
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
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>

        <script>
            var xValues = ["Laptop", "Smartphone", "Tablet", "Accessories"];
            var yValues = [${requestScope.laptop}, ${requestScope.smartphone}, ${requestScope.tablet}, ${requestScope.acces}];
            var barColors = ["red", "green", "blue", "orange"];
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
                            text: 'Number of Blog by Category'
                    }
                    }
            });
        </script>

        <script>
            var xValues = ["Laptop", "Smartphone", "Tablet", "Accessories"];
            var yValues = [${requestScope.laptop1}, ${requestScope.smartphone1}, ${requestScope.tablet1}, ${requestScope.acces1}];
            var barColors = ["red", "green", "blue", "orange"];
            new Chart('myBarchart', {
            type: 'bar',
                    data: {
                    labels: xValues,
                            datasets: [{
                            backgroundColor: barColors,
                                    data: yValues
                            }]
                    },
                    options: {
                    legend: {display: false},
                            title: {
                            display: true,
                                    text: 'Number of Viewer by Category'
                            }
                    }
            });
        </script>

        <script>
            google.charts.load("current", {"packages": ["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
            var data = google.visualization.arrayToDataTable([
            ["Star", "Count"],
            ["5*",${requestScope.star5}],
            ["4*",${requestScope.star4}],
            ["3*",${requestScope.star3}],
            ["2*",${requestScope.star2}],
            ["1*",${requestScope.star1}]
            ]);
            var options = {
            title: "Count Star of Feedback"
            };
            var chart = new google.visualization.BarChart(document.getElementById("myStarchart"));
            chart.draw(data, options);
            }
        </script>

        <script>
            const dataPie = {
            labels: [
            <c:forEach items="${userfeedback}" var="uf">
            "${uf.user.userName}",
            </c:forEach>
            ],
                    datasets: [{
                    label: "My First Dataset",
                            data: [
            <c:forEach items="${userfeedback}" var="uf">
                            "${uf.star}",
            </c:forEach>
                            ],
                            backgroundColor: [
                                    "rgb(255, 99, 132)",
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
            <c:forEach items="${pFeedback}" var="pf">
             "${pf.product.productName}",
            </c:forEach>
            ],
                    datasets: [{
                    label: "My First Dataset",
                            data: [
            <c:forEach items="${pFeedback}" var="pf">
                             "${pf.star}",
            </c:forEach>
                            ],
                            backgroundColor: [
                                    "rgb(255,0,0)",
                                    "rgb(54, 162, 235)",
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
                    document.getElementById("myPFeedback"),
                    configBar
                    );
        </script>


    </body>
</html>
