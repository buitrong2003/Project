<%-- 
    Document   : sideBar
    Created on : Mar 2, 2024, 12:53:03 AM
    Author     : d
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="sidebar navbar-nav">
    <li class="nav-item active">
        <a class="nav-link" href="../admin/dashboard">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
           aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">Login Screens:</h6>
            <a class="dropdown-item" href="login.html">Login</a>
            <a class="dropdown-item" href="register.html">Register</a>
            <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
            <div class="dropdown-divider"></div>
            <h6 class="dropdown-header">Other Pages:</h6>
            <a class="dropdown-item" href="404.html">404 Page</a>
            <a class="dropdown-item" href="blank.html">Blank Page</a>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="chart">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Charts</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="tables.html">
            <i class="fas fa-fw fa-table"></i>
            <span>Tables</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="../admin/category">
            <i class="fas fa-fw fa-list-alt"></i>
            <span>Category</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="../admin/user">
            <i class="fas fa-fw fa-user"></i>
            <span>User</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="../admin/order">
            <i class="fas fa-fw fa-shopping-cart order"></i>
            <span>Order</span>
        </a>
    </li>
</ul>