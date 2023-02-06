<%-- 
    Document   : header
    Created on : Jan 25, 2023, 12:31:34 AM
    Author     : Tu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Start Header Area -->
<header class="header_area sticky-header">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light main_box">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <a class="navbar-brand logo_h" href="home"><img src="<%=request.getContextPath()%>/img/logo.png" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto">
                        <li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/home">Home</a></li>
                        
                        <li class="nav-item">
                            <a href="<%=request.getContextPath()%>/blog" class="nav-link ">Blog</a>
                        </li>
                        <c:if test="${sessionScope.user == null}">
                            <li class="nav-item">
                                <a href="<%=request.getContextPath()%>/common/login.jsp" class="nav-link">Sign in</a>
                            </li>
                            <li class="nav-item">
                                <a href="<%=request.getContextPath()%>/common/register.jsp" class="nav-link">Sign up</a>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.user != null}">
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false">Hello ${sessionScope.user.userName}</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="viewuser.jsp">My Profile</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#">My Orders</a></li>
                                        <c:if test="${sessionScope.user.getRole().getRoleID() == 1}">
                                        <li class="nav-item"><a class="nav-link" href="#">Admin Dashboard</a></li>
                                        </c:if>
                                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/logout">Log Out</a></li>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="nav-item">
                            <form action="viewcart" method="post">
                                <button type="submit" class="btn"><span class="ti-bag position-relative"></span></button> 
                            </form>                               
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<!-- End Header Area -->