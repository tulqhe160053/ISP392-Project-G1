<%-- 
    Document   : viewuser
    Created on : Jan 30, 2023, 11:42:25 PM
    Author     : ducth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <body>
<!--        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
             Navbar Brand
            <a class="navbar-brand ps-3" href="index.html"></a>
             
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
        </nav>-->
        
        <div class="container-fluid rounded bg-white mt-5 mb-5">
            <div class="col">
                <div class="border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span> </span></div>
                    
                </div>
                <div class="border-right d-flex justify-content-center align-items-center ">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-center align-items-center mb-3">
                            <h4 class="text-right">Account Detail</h4>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12"><label for = "pwd">Fullname</label><input type="text" class="form-control" placeholder="full name" value=""></div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-12"><label for = "pwd">Username</label><input type="text" class="form-control" placeholder="enter user number" value=""></div>

                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12"><label for = "pwd">Gender</label></div>
                        </div>


                        <div class="row mt-3 ml-4">
                            <div class="col-md-5"> 
                                <input type="radio" name="gender" id="radio1" value="male">Male
                            </div>

                            <div class="col-md-5">
                                <input type="radio" name="gender" id="radio2" value="female">Female
                            </div>
                            <div class="col-md-12 mt-3"><label for = "pwd">Email</label><input type="email" class="form-control" placeholder="enter email" value=""></div>
                            <div class="col-md-12 mt-3"><label for = "pwd">Phone Number</label><input type="text" class="form-control" placeholder="enter phone number" value=""></div>
                            <div class="col-md-12 mt-3"><label for = "pwd">Role</label>
                                <select class="form-select" name="role_id" id="role">
                                    <option></option>
                                </select>
                            </div>

                            <div class="col-md-12 mt-4"><label for = "pwd">Status</label>
                                <select class="form-select" name="status_id" id="status">
                                    <option>Active</option>
                                    <option>Deactive</option>

                                </select>
                            </div>


                        </div>

                        <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Edit Account</button></div>
                    </div>
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
