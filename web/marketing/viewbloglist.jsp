 

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
        
        <jsp:include page="../nav.jsp"/>
        <div id="layoutSidenav">

            <jsp:include page="../sidenav.jsp"/>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Blog List</h1>


                        <div class="card mb-4">

                            <div class="row">
                                <div class="col-md-6 mt-4">
                                    <form id="filter" action="filterblog" method="get">
                                        <div class="justify-content-md-start row">
                                            <div class="col-md-5 row align-items-center">
                                                <div class="col-md-4">
                                                    <label class="">Category</label>
                                                </div>
                                                <div class="col-md-8">

                                                    <select name="catid" class="form-select" aria-label="Default select example" onchange="document.getElementById('filter').submit();">

                                                        <option value="" >All</option>

                                                        <c:forEach items="${category}" var="c">
                                                            <option <c:if test="${requestScope.catid == c.categoryId}">selected</c:if> value="${c.categoryId}">${c.categoryName}</option>
                                                        </c:forEach>


                                                    </select>  

                                                </div>
                                            </div>


                                            <div class="col-md-4 row align-items-center">
                                                <div class="col-md-4">
                                                    <label class="">Status</label>
                                                </div>
                                                <div class="col-md-8">

                                                    <select name="blogstatusid" class="form-select" aria-label="Default select example" onchange="document.getElementById('filter').submit();">
                                                        <option value="" >All</option>
                                                        <c:forEach items="${blogstatus}" var="b">
                                                            <option <c:if test="${requestScope.status == b.statusID}">selected</c:if> value="${b.statusID}">${b.statusName}</option>
                                                        </c:forEach>
                                                    </select>  

                                                </div>
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
                                            <tr style="text-align: center">
                                                <th>ID</th>
                                                <th style="text-align: center;">Image</th>
                                                <th>Title</th>
                                                <th>Category</th>
                                                <th>Author</th>
                                                <th style="text-align: center;">Time</th>

                                                <th style="text-align: center;">Status</th>



                                            </tr>
                                        </thead>

                                        <c:if test="${listBlog != null}">
                                            <c:forEach items="${listBlog}" var = "b">       
                                                <tbody>

                                                    <tr style="text-align: center">
                                                        <td>${b.id}</td>                                               
                                                        <td><img width=200px" style="" src="<%=request.getContextPath()%>/assets/blog_img/${b.imageLink}" alt="alt"/></td>
                                                        <td>${b.title}</td>
                                                        <td>${b.category.getCategoryName()}</td>
                                                        <td>${b.user.getUserName()}</td>
                                                        <td style="text-align: center;">${b.createTime}</td>

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
                                                <c:if test="${requestScope.page > 1}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="blogmkt?page=${requestScope.page-1}">Previous</a></li>
                                                    </c:if>
                                                    <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="blogmkt?page=${i}">${i}</a></li>
                                                    </c:forEach>
                                                    <c:if test="${requestScope.num > requestScope.page}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="blogmkt?page=${requestScope.page+1}">Next</a></li>
                                                    </c:if>
                                            </ul>
                                        </nav>
                                    </c:if>

                                    <c:if test="${requestScope.check.equals('filter')}">

                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:set var="page" value="${page}"/>
                                                <c:if test="${requestScope.page > 1}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="filterblog?catid=${requestScope.catid}&blogstatusid=${requestScope.status}&page=${requestScope.page-1}">Previous</a></li>
                                                    </c:if>
                                                    <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="filterblog?catid=${requestScope.catid}&blogstatusid=${requestScope.status}&page=${i}">${i}</a></li>
                                                    </c:forEach>
                                                    <c:if test="${requestScope.num > requestScope.page}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="filterblog?catid=${requestScope.catid}&blogstatusid=${requestScope.status}&page=${requestScope.page+1}">Next</a></li>
                                                    </c:if>
                                            </ul>
                                        </nav>
                                    </c:if>

                                    <c:if test="${requestScope.check.equals('search')}">

                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:set var="page" value="${page}"/>
                                                <c:if test="${requestScope.page > 1}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchblog?txt=${requestScope.search}&page=${requestScope.page-1}">Previous</a></li>
                                                    </c:if>
                                                    <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchblog?txt=${requestScope.search}&page=${i}">${i}</a></li>
                                                    </c:forEach>
                                                    <c:if test="${requestScope.num > requestScope.page}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchblog?txt=${requestScope.search}&page=${requestScope.page+1}">Next</a></li>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>