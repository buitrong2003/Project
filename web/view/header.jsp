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
        <style>
            #header {
                width: 100%;
                height: 13vh;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0);
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
                background-color: white;
            }
            .category {
                display: flex;
                color: #267DFD;

            }
            #actions {
                display: flex;
            }

            #actions .item {
                margin-left:22px;
            }
            .account-info:hover .hidden-content {
                visibility: visible;
            }
            .arrow-up {
                position: absolute;
                top: -10px;
                left: 50%;
                transform: translateX(-50%);
                width: 0;
                height: 0;
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                border-bottom: 10px solid white;
            }
            .hidden-content {
                visibility: hidden;
                position: absolute;
                background-color: white;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                padding: 10px;
                z-index: 1;
                transition: visibility 0.5s, opacity 0.5s;
                margin-top: 3%;
                margin-left: -4%;
                display: block;
                width: 12%;
                text-align: center
            }

            .account-info:hover .hidden-content {
                visibility: visible;
            }

            .arrow-up {
                position: absolute;
                top: -10px;
                left: 50%;
                transform: translateX(-50%);
                width: 0;
                height: 0;
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                border-bottom: 10px solid white;
            }

            .hidden-content div:hover {
                background-color: #f0f0f0; /* Màu xám */
                cursor: pointer;
                color: #19C5AE
            }
            .truncate {
                overflow: hidden;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                text-overflow: ellipsis;
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
                <a style="cursor: pointer; margin-right: 10px; display: inline-block; transition: background-color 0.3s ease-in-out; padding: 5px; border-radius: 5px;height: 7vh;display: flex;align-items: center;width: 150%;justify-content: center"
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
                   onmouseout="this.style.backgroundColor = ''; this.style.color = '#267DFD';">
                    Hot
                </a>

            </div>
            <div style="width: 20%;" id="actions">
                <div class="item">
                    <c:if test="${sessionScope.acount != null}">
                        <div id="accountInfo" class="account-info">                               
                            <div style="display: flex;margin-top: 5%;cursor: pointer">
                                <img src="image/user.png"  alt="">
                                <div style="margin-left: 10%;">${sessionScope.acount.getUser_name()}</div>
                                <div class="hidden-content">
                                    <div class="arrow-up"></div>
                                    <div style="width: 100%;margin-top: 5%">Tài khoản của tôi</div>
                                    <div style="width: 100%;margin-top: 5%">Đơn mua</div>
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
                    <img onclick="getToCart()" style="cursor: pointer" src="image/cart.png" alt="">
                </div>
            </div>
        </div>
        <form action="cart" method="post" class="get-to-cart">

        </form>
        <script>
            document.querySelectorAll('.hidden-content div').forEach(item => {
                item.addEventListener('mouseover', function () {
                    this.classList.add('hovered'); // Thêm lớp CSS khi hover vào
                });

                item.addEventListener('mouseout', function () {
                    this.classList.remove('hovered'); // Xóa lớp CSS khi rời khỏi
                });
            });
            var getLogout = () => {
                window.location.href = "login";
            };
            var getSignUp = () => {
                window.location.href = "register";
            };
            var getSignIn = () => {
                window.location.href = "login";
            };
            var getToCart = () => {
                let cart = document.querySelector('.get-to-cart');
                cart.submit();
            };
        </script>
    </body>
</html>
