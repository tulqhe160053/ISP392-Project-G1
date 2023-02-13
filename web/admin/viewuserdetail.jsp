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
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://kit.fontawesome.com/d846362117.css" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
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
            <a class="navbar-brand pe-5" href="user"></a>

            Navbar Search
            <form action="user?action=search" method="post" class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">


            </form>
            Navbar
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"><i class="fas fa-user fa-fw"></i>Hello </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
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
                                Dashboard
                            </a>
                            
                             <a class="nav-link" href="user">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                Manager Users
                            </a>
                             
                            
                             
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>

            <div class="container-fluid rounded bg-white mt-5 mb-5">
                <div class="col">

                    <div class="border-right d-flex justify-content-center align-items-center ">
                        <form action="user?action=edituser&uid=${user.userID}" method="post">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-center align-items-center mb-3">
                                    <h4 class="text-right">Account Detail</h4>
                                </div>
                                

                                <div class="row mt-3">
                                    <div class="col-md-12"><label for = "pwd">Username</label><input name="username" type="text" class="form-control" placeholder="enter user number" value="${user.userName}" readonly></div>

                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12"><label for = "pwd">Gender</label></div>
                                </div>


                                <div class="row mt-3 ml-4">
                                    <div class="col-md-5"> 
                                        <input readonly="" type="radio" name="gender" ${user.getGender() == 'male'?"checked":""} id="radio1" value="male">Male
                                    </div>

                                    <div class="col-md-5">
                                        <input readonly="" type="radio" name="gender" ${user.getGender() == 'female'?"checked":""} id="radio2" value="female">Female
                                    </div>
                                    <div class="col-md-12 mt-3"><label for = "pwd">Email</label><input readonly="" name="email" type="email" class="form-control" placeholder="enter email" value="${user.email}"></div>
                                    <div class="col-md-12 mt-3"><label for = "pwd">Phone Number</label><input readonly="" name ="phone" type="tel" class="form-control" placeholder="enter phone number" value="${user.phoneNum}"></div>
                                    <div class="col-md-12 mt-3"><label for = "pwd">Role</label>
                                        <select class="form-select" name="role_id" id="role">
                                            <c:forEach items="${role}" var="r">
                                                <option <c:if test="${user.role.getRoleName() == r.getRoleName()}">selected</c:if> value="${r.getRoleID()}">${r.getRoleName()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-12 mt-4"><label for = "pwd">Status</label>
                                        <select class="form-select" name="status_id" id="status">
                                            <c:forEach items="${userstatus}" var = "us">
                                                <option <c:if test="${user.userStatus.getStatusName() == us.getStatusName()}">selected</c:if> value="${us.getId()}">${us.getStatusName()}</option>
                                            </c:forEach>

                                        </select>
                                    </div>


                                </div>

                                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Edit Account</button></div>
                            </div>
                        </form>
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
