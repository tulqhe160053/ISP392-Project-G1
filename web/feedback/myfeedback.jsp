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



    <!--================Feedback Area =================-->
    <section class="cart_area">
        <div class="container">
            <div><h2>My Feedback</h2></div>
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ProductID</th>
                                <th scope="col">Star</th>
                                <th scope="col">Detail</th>
                            </tr>
                        </thead>
                    <tbody>
                        <c:forEach items="${listF}" var="f">
                            <tr>
                                <td>${f.product.productID}</td>
                                <td>${f.star}</td>
                                <td>${f.feedbackDetail}</td>

                                <td>
                                    <a href="editfeedback?id=${f.product.productID}" class="edit" data-toggle="modal"><i class="icofont-ui-edit" data-toggle="tooltip" title="Edit">Edit  </i></a>
                                    <a href="#" class="delete" data-toggle="modal"><i class="icofont-ui-delete" data-toggle="tooltip" title="Delete">Delete</i></a>
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