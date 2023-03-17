<%-- 
    Document   : sidenav
    Created on : Mar 15, 2023, 2:21:41 PM
    Author     : ducth
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Core</div>
                <c:if test="${sessionScope.user.role.getRoleID() == 1}">
                    <a class="nav-link" href="admin">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Admin Dashboard
                    </a>
                    <a class="nav-link" href="user">
                        <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                        Manager User
                    </a>
                </c:if>

                <c:if test="${sessionScope.user.role.getRoleID() == 2}">
                    <a class="nav-link" href="sellerdashboard">
                        <div class="sb-nav-link-icon"><i class="fas fa-dashboard"></i></div>
                        Seller Dashboard
                    </a>
                    <a class="nav-link" href="orderseller">
                        <div class="sb-nav-link-icon"><i class="fas fa-bars"></i></div>
                        Manager Orders
                    </a>

                    <a class="nav-link" href="<%=request.getContextPath()%>/ListSellProduct">
                        <div class="sb-nav-link-icon"><i class="fas fa-product-hunt"></i></div>
                        Manager Product
                    </a>
                </c:if>
                
                 <c:if test="${sessionScope.user.role.getRoleID() == 4}">
                    <a class="nav-link" href="mkt">
                        <div class="sb-nav-link-icon"><i class="fas fa-dashboard"></i></div>
                        MKT Dashboard
                    </a>
                    <a class="nav-link" href="blogmkt">
                        <div class="sb-nav-link-icon"><i class="fas fa-book"></i></div>
                        Manager Blog
                    </a>
                    
                    <a class="nav-link" href="<%=request.getContextPath()%>/sliderlistservlet">
                        <div class="sb-nav-link-icon"><i class="fas fa-s"></i></div>
                        Manager Slider
                    </a>

                    <a class="nav-link" href="">
                        <div class="sb-nav-link-icon"><i class="fas fa-comment"></i></div>
                        Manager Feedback
                    </a>
                </c:if>




            </div>
        </div>

    </nav>
</div>