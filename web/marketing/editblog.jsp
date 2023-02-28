<%-- 
    Document   : viewuser
    Created on : Jan 30, 2023, 11:42:25 PM
    Author     : ducth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Edit Blog</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://kit.fontawesome.com/d846362117.css" crossorigin="anonymous">

         
        <style>
            body {
                background: white;
            }

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                background: rgb(99, 39, 120);
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }

            .labels {
                font-size: 11px
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8
            }
        </style>
    </head>
    <body class="sb-nav-fixed">

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            Navbar Brand
            <a class="navbar-brand ps-3" href="#"></a>

            Navbar Search
            <form action="user?action=search" method="post" class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">


            </form>
            Navbar
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"><i class="fas fa-user fa-fw"></i>Hello </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                     
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
                            <a class="nav-link" href="MKTdashboard.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                MKT Dashboard
                            </a>

                            <a class="nav-link" href="blogmkt">
                                <div class="sb-nav-link-icon"><i class="fas fa-anchor"></i></div>
                                Manager Blogs
                            </a>



                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
        </div>

            <div class="container-fluid rounded bg-white mt-5 mb-5">
                <div class="col">

                    <div class="border-right d-flex justify-content-end align-items-end ">

                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-center align-items-center">
                                <h4 class="text-right">Edit Blog</h4>
                            </div>
                            <form action="blogdetailmkt?action=edit_image&blog_id=${blogdetail.id}" method="post" enctype='multipart/form-data'>
                                <div class="row">
                                    <div class="col-md-12 border-right">
                                        <div class="d-flex flex-column align-items-start text-start p-3 py-5"><img width="300px" src="<%=request.getContextPath()%>/assets/blog_img/${blogdetail.imageLink}" id="image" alt="alt"/></div>
                                        <div class="d-flex flex-column align-items-start text-start"><input type="file" name = "image" id="uploadfile"/></div>

                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-12 border-right">
                                    </div>


                                </div>

                                <div class = "row">
                                    <div class="col-md-2">
                                        <div class="d-flex flex-column align-items-center text-center mt-4"><button class="btn btn-secondary" value="submit">Upload</button></div>

                                    </div>
                                    
                                      
                                </div>
                            </form>





                            <form action="blogdetailmkt?action=editblog&blog_id=${blogdetail.id}" method="post">

                                <div class="row mt-3">
                                    <div class="col-md-12"><label for = "pwd">Title</label><input name="title" type="text" class="form-control" value="${blogdetail.title}" placeholder="enter title"></div>

                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12"><label for = "pwd">Desciption</label><textarea type = "text" name = "des" class="form-control" placeholder="enter description">${blogdetail.description}</textarea></div>
                                </div>



                                <div class="row mt-3">



                                    <div class="col-md-12"><label for = "pwd">Content</label><textarea type = "text" name = "content" class="form-control"  placeholder="enter content">${blogdetail.content}</textarea></div>
                                    <div class="col-md-12"><label for = "pwd">Category</label>
                                        <select class="form-select" name="catid">
                                            <c:forEach items="${category}" var="c">
                                                <option <c:if test="${blogdetail.category.getCategoryName() == c.getCategoryName()}">selected</c:if> value="${c.getCategoryId()}">${c.getCategoryName()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                     
                                    <div class="row mt-3">
                                        <div class="col-md-12"><label for = "pwd">Author</label><input name="author" type="text" class="form-control" value="${blogdetail.user.userName}" readonly=""></div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-md-12"><label for = "pwd">Date</label><input name="date" type="date" class="form-control"  value="${blogdetail.createTime}" readonly=""></div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-md-12"><label for = "pwd">Viewer</label><input name="viewer" type="text"  value="${blogdetail.viewer}" class="form-control" readonly=""></div>
                                    </div>
                                    
 

                                </div>
                                <div class="row">
                                    <div class="col-md-12 mt-5 text-center">
                                        <button class="btn btn-primary" type="submit">Edit</button>

                                        <input class="btn btn-secondary" type="reset" value="Reset">
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>
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
