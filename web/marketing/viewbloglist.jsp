 

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
        <title>Blog List</title>
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
                            <a class="nav-link" href="admindashboard.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                MKT Dashboard
                            </a>
                            <a class="nav-link" href="mktblog">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                Manager Blogs
                            </a>

                        </div>
                    </div>

                </nav>
            </div>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Blog List</h1>


                        <div class="card mb-4">

                            <div class="row">
                                <div class="col-md-6 mt-4">
                                    <form action="filterblog" method="get">
                                        <div class="justify-content-md-start row">
                                            <div class="col-md-5 row align-items-center">
                                                <div class="col-md-4">
                                                    <label class="">Category</label>
                                                </div>
                                                <div class="col-md-8">

                                                    <select name="catid" class="form-select" aria-label="Default select example">

                                                        <option value="" >All</option>

                                                        <c:forEach items="${category}" var="c">
                                                            <option <c:if test="${requestScope.catid == c.categoryId}">selected</c:if> value="${c.categoryId}">${c.categoryName}</option>
                                                        </c:forEach>


                                                    </select>  

                                                </div>
                                            </div>

                                            <div class="col-md-5 row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="">Status</label>
                                                </div>
                                                <div class="col-md-8">

                                                    <select name="blogstatusid" class="form-select" aria-label="Default select example">
                                                        <option value="" >All</option>
                                                        <c:forEach items="${blogstatus}" var="b">
                                                            <option <c:if test="${requestScope.status == b.statusID}">selected</c:if> value="${b.statusID}">${b.statusName}</option>
                                                        </c:forEach>
                                                    </select>  

                                                </div>
                                            </div>



                                            <div class="col-md-2 md-0">
                                                <input type="submit" class="btn btn-primary" value="Filter">
                                            </div>


                                        </div>
                                    </form>
                                </div>

                                <div class="col-md-6 mt-4 row">

                                    <div class="col-md-8">
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


                                </div>



                                <div class="card-body">
                                    <table width ="100%">

                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th style="text-align: center;">Image</th>
                                                <th>Title</th>
                                                <th>Category</th>
                                                <th>Author</th>
                                                <th style="text-align: center;">Time</th>
                                                <th>Viewer</th>
                                                <th style="text-align: center;">Status</th>



                                            </tr>
                                        </thead>

                                        <c:if test="${listBlog != null}">
                                            <c:forEach items="${listBlog}" var = "b">       
                                                <tbody>

                                                    <tr>
                                                        <td>${b.id}</td>                                               
                                                        <td><img width=200px" style="" src="<%=request.getContextPath()%>/assets/blog_img/${b.imageLink}" alt="alt"/></td>
                                                        <td>${b.title}</td>
                                                        <td>${b.category.getCategoryName()}</td>
                                                        <td>${b.user.getUserName()}</td>
                                                        <td style="text-align: center;">${b.createTime}</td>
                                                        <td style="text-align: center;">${b.viewer}</td>

                                                        <c:if test="${b.blogstatus.statusName == 'Active'}">
                                                            <td style="text-align: center;"> 
                                                                <a class ="btn btn-success" href="blogdetailmkt?action=editstatus&type=active&bid=${b.id}&statusid=${b.blogstatus.statusID}">${b.blogstatus.getStatusName()}</a>
                                                            </td>
                                                        </c:if>

                                                        <c:if test="${b.blogstatus.statusName == 'Hide'}">
                                                            <td style="text-align: center;"> 
                                                                <a class ="btn btn-secondary" href="blogdetailmkt?action=editstatus&type=hide&bid=${b.id}&statusid=${b.blogstatus.statusID}">${b.blogstatus.getStatusName()}</a>
                                                            </td>
                                                        </c:if>


                                                        <td style="text-align: center"> <a style="margin: 0 10px 0 10px  ;" href="blogdetailmkt?action=blogdetail&blog_id=${b.id}"><i class="fa-solid fa-book"  style="color:#22baa0"></i></a></i></td>
                                                        <td style="text-align: center"> <a style="margin: 0 10px 0 10px  ;" href="blogdetailmkt?action=delete&bid=${b.id}"><i class="fa-solid fa-trash"style="color:#22baa0"></i></a></i></td>




                                                    </tr>

                                                </tbody>


                                            </c:forEach> 
                                        </c:if>
                                    </table>

                                    <c:if test="${requestScope.check.equals('list')}">

                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:set var="page" value="${page}"/>
                                                 
                                                <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="blogmkt?page=${i}">${i}</a></li>
                                                    </c:forEach>
                                            </ul>
                                        </nav>
                                    </c:if>

                                    <c:if test="${requestScope.check.equals('filter')}">

                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:set var="page" value="${page}"/>
                                                 
                                                <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="filterblog?catid=${requestScope.catid}&blogstatusid=${requestScope.status}&page=${i}">${i}</a></li>
                                                    </c:forEach>
                                            </ul>
                                        </nav>
                                    </c:if>

                                    <c:if test="${requestScope.check.equals('search')}">

                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:set var="page" value="${page}"/>
                                                <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchblog?txt=${requestScope.search}&page=${i}">${i}</a></li>
                                                    </c:forEach>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>