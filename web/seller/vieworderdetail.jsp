

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
        <title>Order Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://kit.fontawesome.com/d846362117.css" crossorigin="anonymous">

    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="../nav.jsp"/>
        <div id="layoutSidenav">
            <jsp:include page="../sidenav.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">

                        <h1 class="mt-4">Order Detail</h1>
                        <div class="mt-auto">
                            <a href="<%=request.getContextPath()%>/orderseller" class="btn btn-danger ">Back</a>
                        </div>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Order Detail
                            </div>

                            <div class="card-body">
                                <table width ="100%">

                                    <thead>
                                        <tr style="text-align: center">
                                            <th>ID</th>
                                            <th>Product Name</th>
                                            <th>Product Image</th>
                                            <th>Total Price</th>

                                        </tr>
                                    </thead>
                                    <c:forEach items="${requestScope.detail}" var="d">
                                        <c:forEach items="${requestScope.pimg}" var = "img">
                                            <c:if test="${d.product.productID == img.product.productID}" >
                                                <tbody>

                                                    <tr style="text-align: center">
                                                        <td>${d.product.productID}</td>
                                                        <td>${d.product.productName}</td>
                                                        <td><img style="width : 120px;" src="<%=request.getContextPath()%>/assets/product_img/${d.product.category.categoryName}/${d.product.brand.brandName}/${img.productImgUrl}" alt="alt"/></td> 

                                                        <td>${d.amount}$</td>

                                                    </tr>
                                                </tbody>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>



                                </table>





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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>

    </body>
</html>
