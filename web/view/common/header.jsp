<%-- 
    Document   : header
    Created on : Feb 5, 2024, 10:09:36 AM
    Author     : d
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
        <style>
            .avatar-container {
                width: 100%; /* Điều chỉnh kích thước hình ảnh nhỏ hơn */
                height: 40px; /* Điều chỉnh kích thước hình ảnh nhỏ hơn */
                border-radius: 50%; /* Tạo hình tròn */
                overflow: hidden; /* Ẩn phần ngoài vùng hình tròn */
            }

            .avatar {
                width: 200%; /* Đảm bảo hình ảnh điền đầy vùng hình tròn */
                height: 100%; /* Đảm bảo hình ảnh điền đầy vùng hình tròn */
                object-fit: cover; /* Đảm bảo hình ảnh không bị méo khi thu nhỏ */
            }

        </style>
    </head>
    <body>
        <div id="header">
            <a style="text-decoration: none; color: #8B4513; font-weight: bold; display: flex; align-items: center; margin-left: 20px;width: 20%" href="home" class="logo">
                <img style="width: 25%;" src="image/logo.jpg" alt="alt"/>
                <div style="font-family: 'Times New Roman', Times, serif; font-size: 24px; margin-left: 10px;">Book Store</div>
            </a>
            <div style="" class="category">
                <a href="home" style="cursor: pointer; margin-right: 10px; transition: background-color 0.3s ease-in-out; padding: 5px; border-radius: 5px;height: 7vh;display: flex;align-items: center;text-decoration: none;width: 70%;justify-content: center"
                   onmouseover="this.style.backgroundColor = 'purple'; this.style.color = 'white';"
                   onmouseout="this.style.backgroundColor = ''; this.style.color = '#267DFD';">
                    Home
                </a>
                <a href="profile" style="cursor: pointer; margin-right: 10px; display: inline-block; transition: background-color 0.3s ease-in-out; padding: 5px; border-radius: 5px;height: 7vh;display: flex;align-items: center;width: 150%;justify-content: center"
                   onmouseover="this.style.backgroundColor = 'purple'; this.style.color = 'white';"
                   onmouseout="this.style.backgroundColor = ''; this.style.color = '#267DFD';">
                    About me
                </a>
                <a href="category" style="cursor: pointer; margin-right: 10px; display: inline-block; transition: background-color 0.3s ease-in-out; padding: 5px; border-radius: 5px;height: 7vh;display: flex;align-items: center;text-decoration: none;width: 70%;justify-content: center"
                   onmouseover="this.style.backgroundColor = 'purple'; this.style.color = 'white';"
                   onmouseout="this.style.backgroundColor = ''; this.style.color = '#267DFD';">
                    Category
                </a>
                <a style="cursor: pointer; margin-right: 10px; display: inline-block; transition: background-color 0.3s ease-in-out; padding: 5px; border-radius: 5px;height: 7vh;display: flex;align-items: center;width: 40%"
                   onmouseover="this.style.backgroundColor = 'purple'; this.style.color = 'white';"
                   onmouseout="this.style.backgroundColor = ''; this.style.color = '#267DFD';" href="contact">
                    Contact
                </a>
            </div>
            <div style="width: 20%;" id="actions">
                <div class="item">
                    <c:if test="${sessionScope.acount != null}">
                        <div id="accountInfo" class="account-info">                               
                            <div style="display: flex;margin-top: 5%;cursor: pointer">
                                <div class="avatar-container">
                                    <img class="avatar" src="image/${sessionScope.acount.image}" alt="">
                                </div>
                                <div style="margin-left: 10%;">${sessionScope.acount.getUser_name()}</div>
                                <div class="hidden-content">
                                    <div class="arrow-up"></div>
                                    <a href="profile" style="width: 100%;margin-top: 5%">Tài khoản của tôi</a>
                                    <a href="completed" style="width: 100%;margin-top: 5%">Đơn mua</a>
                                    <div onclick="getLogout()" style="width: 100%;margin-top: 5%">Đăng xuất</div>
                                </div>
                            </div>                               
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.acount == null}">
                        <div style="display: flex;justify-content: center;align-items: center;color: #F7941D">
                            <div style="cursor: pointer;padding: 5px; border-radius: 5px;height: 7vh"onmouseover="this.style.backgroundColor = 'purple'; this.style.color = 'white';"
                                 onmouseout="this.style.backgroundColor = ''; this.style.color = '#F7941D';" onclick="getSignUp()">Đăng kí</div>
                            <div style="padding: 5px; border-radius: 5px;height: 7vh">|</div>
                            <div style="cursor: pointer;padding: 5px; border-radius: 5px;height: 7vh" onmouseover="this.style.backgroundColor = 'purple'; this.style.color = 'white';"
                                 onmouseout="this.style.backgroundColor = ''; this.style.color = '#F7941D';" onclick="getSignIn()">Đăng nhập</div>
                        </div>
                    </c:if>
                </div>
                <div class="item">
                    <form action="cart" class="get-to-cart">
                        <img onclick="return this.closest('form').submit()" style="cursor: pointer" src="image/cart.png" alt="">
                    </form>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/header.js"></script>
    </body>
</html>
