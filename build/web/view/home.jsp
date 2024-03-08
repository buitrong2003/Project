<%-- 
    Document   : home
    Created on : Feb 5, 2024, 10:09:56 AM
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
    </head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css"/>
    <body>
        <div id="wrapper">
            <%@include file="common/header.jsp" %>
            <div style="width: 100%;overflow: hidden;margin-top: -4%">
                <div class="image-wapper" style="margin-top: 9%; display: flex;transition: 0.5s" >
                    <img class="banner-image" style="width: 100%;cursor: pointer" src="https://images-production.bookshop.org/spree/promo_banner_slides/desktop_images/293/original/582655846-theexchange_bookshop_2048x600.jpg?1709048548" alt="Banner Image 1">
                    <img class="banner-image" style="width: 100%;cursor: pointer" src="https://images-production.bookshop.org/spree/promo_banner_slides/desktop_images/294/original/Tartt_The-Secret-History_Bookshop-desktop-2048x600-v01.jpg?1709048612" alt="Banner Image 2">
                    <img class="banner-image" style="width: 100%;cursor: pointer" src="https://images-production.bookshop.org/spree/promo_banner_slides/desktop_images/293/original/582655846-theexchange_bookshop_2048x600.jpg?1709048548" alt="Banner Image 3"/>
                </div>
            </div>
            <h2 style="text-align: center;margin: 2% 0%;border-bottom: 1px solid #E4E4E4;color: #2980B9">Sách hay xem nhiều</h2>
            <div id="wp-products" style="margin-top: -10%;position: relative">
                <div class="container" style="overflow: hidden; width: 100%; white-space: nowrap; font-size: 0; line-height: 0;">
                    <h1 onclick="getChange(-1)" style="position: absolute; left: 8%; top: 50%; transform: translateY(-50%); z-index: 2; background: white; border: none; font-size: 24px; cursor: pointer; width: 40px; height: 40px; border-radius: 50%; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); display: flex; justify-content: center; align-items: center;color: #573BA2"><</h1>
                    <div class="row" id="handleChange" style="display: inline-block; white-space: nowrap; overflow-x: auto; padding: 10px 0;width: 100%;transition: 0.5s">
                        <c:forEach items="${requestScope.listBookHot}" var="bookHot">
                            <input id="${bookHot.getBook_id()}" type="hidden" name="book" value="${bookHot}">
                            <img class="hover-scale" onclick="getDetailsHome('${bookHot.getBook_id()}')" src="image/${bookHot.image}" style="display: inline-block; vertical-align: top; height: 50vh;width: 20%;cursor: pointer;z-index: 1;border-radius: 20px;transition: transform 0.3s ease-in-out;"/>
                        </c:forEach>
                    </div>
                    <h1 onclick="getChange(1)" style="position: absolute; right: 10%; top: 50%; transform: translateY(-50%); z-index: 2; background: none; border: none; font-size: 24px; cursor: pointer;width: 40px; height: 40px; border-radius: 50%; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); display: flex; justify-content: center; align-items: center; background: white;color: #573BA2">></h1>
                </div>
            </div>
            <h2 style="text-align: center;margin-top: -5%;margin-bottom: 2%;border-bottom: 1px solid #E4E4E4;color: #2980B9">Sách mới cập nhật</h2>
            <div class="container">
                <div class="row">
                    <c:forEach items="${requestScope.listNewBook}" var="book" varStatus="status">
                        <div  class="col-md-3 mb-3">
                            <div style="box-shadow: 0px 0px 10px rgba(0,0,0,0.1);width: 90%;height: 80vh;background-color: white;border-radius: 6px">
                                <div style="width: 80%;margin: 0 auto">
                                    <img class="hover-scale" onclick="getDetailsHome('${book.getBook_id()}')" style="transition: transform 0.3s ease-in-out;height: 45vh;border-radius: 6px;width: 100%;cursor: pointer;margin-top: 10%;" src="image/${book.image}" alt="alt"/>
                                    <input id="${book.getBook_id()}" type="hidden" name="book" value="${book}">
                                    <div style="margin-top: 5%;height: 8vh;font-weight: 500;cursor: pointer" onclick="getDetailsHome('${book.getBook_id()}')" class="truncate book-home">${book.name}</div>
                                    <div style="width: 100%">
                                        <div style="font-size: 80%">${book.author}</div>
                                    </div>
                                    <div style="display: flex;justify-content: center;margin-top: 10%;gap: 20%">
                                        <div style="text-decoration: line-through;color: #9E9E9E">
                                            <script>
                                                var newPrice = ${book.price + 200000};
                                                var formattedPrice = newPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
                                                formattedPrice = formattedPrice.replace(/,/g, '.');
                                                document.write('₫' + formattedPrice);
                                            </script>
                                        </div>
                                        <div style="color: #F59481">
                                            <script>
                                                var newPrice = ${book.price};
                                                var formattedPrice = newPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
                                                formattedPrice = formattedPrice.replace(/,/g, '.');
                                                document.write('₫' + formattedPrice);
                                            </script>
                                        </div>
                                    </div>
                                    <button style="width: 100%;border: none;margin-bottom: 15%;margin-top: 10%;background-color: #008CFA;padding: 5px;border-radius: 10px;color: white" onclick="getDetailsHome('${book.getBook_id()}')">Mua Ngay</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <%@include file="common/footer.jsp" %>
            <script src="${pageContext.request.contextPath}/js/home.js"></script>
        </div>        
    </body>
</html>
