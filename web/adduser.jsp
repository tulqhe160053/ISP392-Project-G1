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
        <title>Add User</title>
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

        <jsp:include page="nav.jsp"/>
        <div id="layoutSidenav">
            <jsp:include page="sidenav.jsp"/>

            <div class="container-fluid rounded bg-white mt-5 mb-5">
                <div class="col">

                    <div class="border-right d-flex justify-content-center align-items-center ">

                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-center align-items-center mb-3">
                                <h4 class="text-right">Add Account</h4>
                            </div>

                            <div class ="row">
                                <div class="col-md-12">
                                     <h3 class="text-danger">${message}</h3>
                                </div>      
                            </div>

                            <form action="adduser" method="post">
                                <div class="row mt-3">
                                    <div class="col-md-12"><label for = "pwd">Username</label><input name="username" type="text" class="form-control" placeholder="enter user number" required></div>

                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12"><label for = "pwd">Password</label><input name="password" type="password" class="form-control" placeholder="enter password" required></div>

                                </div>


                                <div class="row mt-3">
                                    <div class="col-md-12"><label for = "pwd">Gender</label></div>
                                </div>


                                <div class="row mt-3 ml-4">
                                    <div class="col-md-5"> 
                                        <input  type="radio" name="gender" id="radio1" value="male">Male
                                    </div>

                                    <div class="col-md-5">
                                        <input type="radio" name="gender" id="radio2" value="female">Female
                                    </div>
                                    <div class="col-md-12 mt-3"><label for = "pwd">Email</label><input name="email" type="email" class="form-control" placeholder="enter email" required></div>
                                    <div class="col-md-12 mt-3"><label for = "pwd">Phone Number</label><input name ="phone" type="tel" class="form-control" placeholder="enter phone number" required></div>
                                    <div class="col-md-12 mt-3"><label for = "pwd">Role</label>
                                        <select class="form-select" name="role_id" id="role">
                                            <option value="1">Admin</option>
                                            <option value="2">Seller</option>
                                            <option value="3">Customer</option>
                                            <option value="4">Marketing</option>

                                        </select>
                                    </div>


                                    <div class="row mt-3">
                                        <div class="col-md-12"><label for = "pwd">Status</label></div>
                                    </div>
                                    <div class="col-md-5"> 
                                        <input  type="radio" name="status_id" id="radio1" value="1">Active
                                    </div>

                                    <div class="col-md-5">
                                        <input type="radio" name="status_id" id="radio2" value="2">Locked
                                    </div>



                                </div>
                                <div class="row">
                                    <div class="col-md-12 mt-5 text-center">
                                        <button class="btn btn-primary" type="submit">Add</button>

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
