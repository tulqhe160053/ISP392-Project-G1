

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
        <title>Order List</title>
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

                        <h1 class="mt-4">Order List</h1>




                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Order List
                            </div>

                            <div class="row">

                                <div class="col-md-10 mt-4">
                                    <form id="filter" action="filterseller" method="get">
                                        <div class="justify-content-md-start row">

                                            <div class="col-md-4 row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="form-label">From</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="date" value="${requestScope.from}" name="from" onchange="document.getElementById('filter').submit()">

                                                </div>
                                            </div>
                                            <div class="col-md-3 row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="form-label">To</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="date" value="${requestScope.to}" name="to" onchange="document.getElementById('filter').submit()">
                                                </div>  
                                            </div>

                                            <div class="col-md-3 row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="form-label">Status</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <select name="status" class="form-select" onchange="document.getElementById('filter').submit()">
                                                        <option value="" >All</option>
                                                        <option value="1"<c:if test="${requestScope.status.equals('1')}">selected</c:if>>Delivering</option>
                                                        <option value="2"<c:if test="${requestScope.status.equals('2')}">selected</c:if>>Successful</option>
                                                         
                                                        </select>
                                                    </div>  
                                                </div>


                                            </div>
                                        </form>






                                    </div>

<!--                                  <div class="col-md-4 mt-4 row">

                                    <div class="col-md-10">
                                        <div class="search-bar p-1 d-lg-block ms-2">                                                        
                                            <div id="search" class="menu-search mb-2">
                                                <form action="searchblog" method="get" id="searchform" class="searchform">
                                                    <div class="container">
                                                        <div class="row">
                                                            <span> 
                                                                <input type="text" class="col-8" name="txt" placeholder="Search...">
                                                                <button style="border: none;" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                                                            </span>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>

                                        </div>
                                    </div>


                                </div>-->





                                </div>

                                <div class="card-body">
                                    <table width ="100%">

                                        <thead>
                                            <tr style="text-align: center">
                                                <th>ID</th>
                                                <th>Customer</th>
                                                <th>District</th>
                                                <th>City</th>
                                                <th>Total Price</th>
                                                <th>Order Date</th>
                                                <th>Status</th>



                                            </tr>
                                        </thead>
                                    <c:forEach items="${requestScope.order}" var="o">
                                        <tbody>

                                            <tr style="text-align: center">
                                                <td>${o.getId()}</td>                                               
                                                <td>${o.user.userName}</td>
                                                <td>${o.shipAddress.district.getDistrictName()}</td>
                                                <td>${o.getShipAddress().getShipCity().getCityName()}</td>
                                                <td>${o.totalPrice}$</td>
                                                <td>${o.orderDate}</td>


                                                

                                                <c:if test="${o.orderStatus.getName() == 'Delivering'}">
                                                    <td>
                                                        <a class="btn btn-secondary" href="orderdetailseller?action=updatestatus&type=1&oid=${o.getId()}&sid=${o.orderStatus.getId()}">${o.orderStatus.getName()}</a>
                                                    </td>
                                                </c:if>

                                                <c:if test="${o.orderStatus.getName() == 'Successful'}">
                                                    <td>
                                                        <a class="btn btn-success" href="">${o.orderStatus.getName()}</a>
                                                    </td>
                                                </c:if>

                                                 
                                                    <td style="text-align: center"> <a style="margin: 0 10px 0 10px;" href="orderdetailseller?action=orderdetail&oid=${o.getId()}"><i class="fa fa-eye"></i></a></td>

                                            </tr>

                                        </tbody>
                                    </c:forEach>



                                </table>
                                <c:if test="${requestScope.check.equals('list')}">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:set var="page" value="${page}"/>
                                            <c:if test="${requestScope.page > 1}">
                                                <li class="page-item"><a class="page-link ${i==page?"current":""}" href="orderseller?page=${requestScope.page-1}">Previous</a></li>
                                                </c:if>
                                                <c:forEach begin="${1}" end="${num}" var="i">
                                                <li class="page-item"><a class="page-link ${i==page?"current":""}" href="orderseller?page=${i}">${i}</a></li>
                                                </c:forEach>
                                                <c:if test="${requestScope.num > requestScope.page}">
                                                <li class="page-item"><a class="page-link ${i==page?"current":""}" href="orderseller?page=${requestScope.page+1}">Next</a></li>
                                                </c:if>    
                                        </ul>
                                    </nav>
                                </c:if>

                                <c:if test="${requestScope.check.equals('filter')}">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:set var="page" value="${page}"/>
                                            <c:if test="${requestScope.page > 1}">
                                                <li class="page-item"><a class="page-link ${i==page?"current":""}" href="orderseller?from=${requestScope.from}&to=${requestScope.to}&status=${requestScope.status}&page=${requestScope.page-1}">Previous</a></li>
                                                </c:if>
                                                <c:forEach begin="${1}" end="${num}" var="i">
                                                <li class="page-item"><a class="page-link ${i==page?"current":""}" href="orderseller?from=${requestScope.from}&to=${requestScope.to}&status=${requestScope.status}&page=${i}">${i}</a></li>
                                                </c:forEach>
                                                <c:if test="${requestScope.num > requestScope.page}">
                                                <li class="page-item"><a class="page-link ${i==page?"current":""}" href="orderseller?from=${requestScope.from}&to=${requestScope.to}&status=${requestScope.status}&page=${requestScope.page+1}">Next</a></li>
                                                </c:if>

                                        </ul>
                                    </nav>
                                </c:if>




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
