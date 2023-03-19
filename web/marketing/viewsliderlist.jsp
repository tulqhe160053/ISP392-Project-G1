<%-- 
    Document   : viewsliderlist
    Created on : Mar 17, 2023, 3:32:56 PM
    Author     : Trang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Feedback</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/img/favicon.ico">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/templatemo.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nice-select.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nouislider.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/magnific-popup.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    </head>    
    
    <!-- Start Header Area -->
    <jsp:include page="../header.jsp" />
    <!-- End Header Area -->



    <!--================Slider Area =================-->
    <section class="cart_area">
        <div class="container">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-5">
                                <h2>Slider List</h2>
                            </div>
                            <div class="col-sm-5">
                                <a href="AddSlider" class="btn btn-success" data-toggle="modal"> <span>Add New Slider</span></a>
                                <a href="" class="btn btn-danger" data-toggle="modal"> <span>Back</span></a>
                            </div>
                        </div>
                    </div>
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Image</th>
                                <th scope="col">Category</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                    <tbody>
                        <c:forEach items="${listS}" var="s">
                            <tr>
                                <td>${s.sliderID}</td>
                                <td><img src="<%=request.getContextPath()%>/assets/banner_img/${s.urlImage}" alt="error" style="width: 100px"></td>
                                <td>${s.category.categoryName}</td>
                                <td><a href="editslider?id=${s.sliderID}" data-toggle="modal" >Edit</a></td>
                                <td>
                                    <a class="text-danger" data-toggle="modal" data-target="#delete-address-modal" href="deleteslider?id=${s.sliderID}" onclick="return confirm('Are you sure you want to delete these Slider?');" ><i class="icofont-ui-delete"></i> Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <!-- Start footer -->
    <%@include file="../footer.jsp" %>

    <!-- End footer -->

    <!-- Start Script -->
    <script src="<%=request.getContextPath()%>/assets/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/templatemo.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/custom.js"></script>
    <!-- End Script -->
</body>
</html>
