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
        <title>List User</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://kit.fontawesome.com/d846362117.css" crossorigin="anonymous">

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
                        <h1 class="mt-4">User List</h1>




                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                List User
                            </div>

                            <div class="row">
                                <div class="col-md-6 mt-4">
                                    <form action="filteruser" method="get">
                                        <div class="justify-content-md-start row">
                                            <div class="col-md-6 row align-items-center">
                                                <div class="col-md-2">
                                                    <label class="form-label">Role</label>
                                                </div>
                                                <div class="col-md-8">

                                                    <select name="role_id" class="form-select" aria-label="Default select example">

                                                        <option value="" >All</option>
                                                        <option value="1" <c:if test="${requestScope.role.equals('1')}">selected</c:if>  >Admin</option>
                                                        <option value="2" <c:if test="${requestScope.role.equals('2')}">selected</c:if> >Seller</option>
                                                        <option value="3" <c:if test="${requestScope.role.equals('3')}">selected</c:if> >Customer</option>
                                                        <option value="4" <c:if test="${requestScope.role.equals('4')}">selected</c:if> >Marketing</option>

                                                        </select>  

                                                    </div>
                                                </div>
                                                <div class="col-md-4 row align-items-center">
                                                    <div class="col-md-4">
                                                        <label class="form-label">Status</label>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <select name="status" class="form-select" aria-label="Default select example">
                                                            <option value="" >All</option>
                                                            <option value="1" <c:if test="${requestScope.status.equals('1')}">selected</c:if> >Active</option>
                                                        <option value="2" <c:if test="${requestScope.status.equals('2')}">selected</c:if> >Locked</option>
                                                        </select>
                                                    </div>  
                                                </div>


                                                <div class="col-md-2 md-0">
                                                    <button type="submit" class="btn btn-primary">Filter</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>


                                    <div class="row col-md-6 mt-4">



                                        <div class="col-md-8">
                                            <div class="search-bar p-1 d-lg-block ms-2">                                                        
                                                <div id="search" class="menu-search mb-2">
                                                    <form action="searchuser" method="get" id="searchform" class="searchform">
                                                        <div class="container">
                                                            <div class="row">
                                                                <span> 
                                                                    <input oninput="searchBy(this" value="${txtS}" type="text" class="col-8" name="txt" placeholder="Search...">
                                                                <button style="border: none;" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                                                            </span>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <a class="btn btn-secondary" href="adduser.jsp">Add new User</a>
                                    </div>
                                </div>



                                <div class="card-body">
                                    <table width ="100%">

                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Gender</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Role</th>
                                                <th>Status</th>



                                            </tr>
                                        </thead>

                                        <c:if test="${user != null}"> 
                                            <c:forEach items="${user}" var = "u">       
                                                <tbody>

                                                    <tr>
                                                        <td>${u.userID}</td>                                               
                                                        <td>${u.userName}</td>
                                                        <td>${u.gender}</td>
                                                        <td>${u.email}</td>
                                                        <td>${u.phoneNum}</td>

                                                        <td>${u.role.getRoleName()}</td>

                                                        <c:if test="${u.userStatus.statusName == 'Active'}"> 
                                                            <td>
                                                                <a class="btn btn-success" href="userdetail?action=editstatus&type=active&uid=${u.userID}&sid${u.userStatus.id}">${u.userStatus.getStatusName()}</a>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${u.userStatus.statusName == 'Locked'}"> 
                                                            <td>
                                                                <a class="btn btn-danger" href="userdetail?action=editstatus&type=locked&uid=${u.userID}&sid${u.userStatus.id}">${u.userStatus.getStatusName()}</a>
                                                            </td>
                                                        </c:if>





                                                        <td style="text-align: center"> <a style="margin: 0 10px 0 10px  ;" href="userdetail?action=update&uid=${u.userID}"><i class="fa-solid fa-user"  style="color:#22baa0"></i></a></i></td>

                                                    </tr>

                                                </tbody>


                                            </c:forEach> 
                                        </c:if>
                                    </table>

                                    <c:if test="${requestScope.check.equals('list')}">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:set var="page" value="${page}"/>
                                                <c:if test="${requestScope.page > 1}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="user?page=${requestScope.page-1}">Previous</a></li>
                                                    </c:if>
                                                    <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="user?page=${i}">${i}</a></li>
                                                    </c:forEach>
                                                    <c:if test="${requestScope.num > requestScope.page}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="user?page=${requestScope.page+1}">Next</a></li>
                                                    </c:if>    
                                            </ul>
                                        </nav>
                                    </c:if>

                                    <c:if test="${requestScope.check.equals('filter')}">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:set var="page" value="${page}"/>
                                                <c:if test="${requestScope.page > 1}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="filteruser?role_id=${requestScope.role}&status=${requestScope.status}&page=${requestScope.page-1}">Previous</a></li>
                                                    </c:if>
                                                <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="filteruser?role_id=${requestScope.role}&status=${requestScope.status}&page=${i}">${i}</a></li>
                                                    </c:forEach>
                                                    <c:if test="${requestScope.num > requestScope.page}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="filteruser?role_id=${requestScope.role}&status=${requestScope.status}&page=${requestScope.page+1}">Next</a></li>
                                                    </c:if>
                                                    
                                            </ul>
                                        </nav>
                                    </c:if>

                                    <c:if test="${requestScope.check.equals('search')}">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:set var="page" value="${page}"/>
                                                <c:if test="${requestScope.page > 1}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchuser?txt=${requestScope.search}&page=${requestScope.page-1} ">Previous</a></li>
                                                    </c:if>
                                                <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchuser?txt=${requestScope.search}&page=${i}">${i}</a></li>
                                                    </c:forEach>
                                                     <c:if test="${requestScope.num > requestScope.page}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchuser?txt=${requestScope.search}&page=${requestScope.page+1}">Next</a></li>
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
