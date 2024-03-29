<%-- 
    Document   : category
    Created on : Feb 5, 2024, 11:22:00 AM
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/category.css"/>
    <body style=" background-color: #EBEBEB">
        <div id="wrapper" style="margin-bottom: 2%">
            <%@include file="common/header.jsp" %>
            <div style="display: flex;width: 85%;margin: 0 auto;margin-top: 7%;gap: 5%">
                <div style="width: 25%;box-shadow: 0px 0px 10px rgba(0,0,0,0);">
                    <div style="cursor: pointer;background-color: #00B9F2;color: white;padding-top: 5%;padding-bottom: 5%;text-indent: 5%;border-top-left-radius: 6px;border-top-right-radius: 6px">
                        <i class='bx bx-menu'></i>
                        Danh mục
                    </div>
                    <div>                        
                        <c:forEach items="${requestScope.listCategory}" var="category" varStatus="loopStatus">
                            <a href="category?search=category&categoryid=${category.category_id}">
                                <div class="category-book" 
                                     style="cursor: pointer;
                                     background-color: white;
                                     border-bottom: ${loopStatus.last ? 'none' : '1px solid #EFEFEF'};
                                     border-bottom-left-radius: ${loopStatus.last ? '6px' : '0'};
                                     border-bottom-right-radius: ${loopStatus.last ? '6px' : '0'};
                                     padding: 6% 0px;
                                     text-indent: 5%;
                                     color: black">
                                    ${category.name}
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-5" style="margin-bottom: 3%">
                            <input id="searchInput" class="form-control" placeholder="Search" 
                                   type="search" style="border-radius: 6px; border: 1px solid #ddd;
                                   background-color: #f5f5f5; padding: 8px 20px 8px 8px; padding-left: 20px;
                                   background-size: 20px 20px; background-position: right 10px center;
                                   background-repeat: no-repeat; transition: box-shadow 0.3s,
                                   border-color 0.3s;" onfocus="this.style.boxShadow = '0 0 5px white';
                                           this.style.borderColor = 'transparent';
                                           this.style.outline = 'none';" 
                                   onblur="this.style.boxShadow = 'none';
                                           this.style.borderColor = '#ddd';" 
                                   onkeyup="if (event.keyCode === 13) {
                                               performSearch();
                                           }" value="${requestScope.keyword == null ? "" : requestScope.keyword}">
                        </div>
                        <div class="col-md-2">
                            <select class="form-control" id="chooseOption">
                                <option value="Name" ${requestScope.option eq "Name" ? 'selected="selected"' : ''}>Name</option>
                                <option value="Author" ${requestScope.option eq "Author" ? 'selected="selected"' : ''}>Author</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <button onclick="performSearch()" class="btn btn-primary">Search</button>
                        </div>
                        <div class="col-md-2">
                            <select class="form-control form-sort" onchange="sortByBook('${requestScope.pageControl.page}', '${requestScope.pageControl.urlPattern}')">
                                <option class="sort" ${requestScope.sortBook eq "keepStable" ? 'selected="selected"' : ''} value="keepStable">Sắp Xếp</option>
                                <option class="sort" ${requestScope.sortBook eq "ascending" ? 'selected="selected"' : ''} value="ascending">Tăng dần theo giá</option>
                                <option class="sort" ${requestScope.sortBook eq "decrease" ? 'selected="selected"' : ''} value="decrease">Giảm dần theo giá</option>
                            </select>
                        </div>
                        <c:forEach items="${requestScope.listBook}" var="book" varStatus="status">
                            <div  class="col-md-3 mb-3">
                                <div style="box-shadow: 0px 0px 10px rgba(0,0,0,0);width: 100%;height: 65vh;background-color: white;border-radius: 6px">
                                    <div style="width: 80%;margin: 0 auto">
                                        <img class="hover-scale" onclick="getDetails('${book.getBook_id()}')"
                                             style="transition: transform 0.3s ease-in-out;height: 35vh;border-radius: 6px;width: 100%;cursor: pointer;margin-top: 10%;" src="image/${book.image}" alt="alt"/>
                                        <input id="${book.getBook_id()}" type="hidden" name="book" value="${book}">
                                        <div style="margin-top: 5%;height: 8vh;font-weight: 500;cursor: pointer" onclick="getDetails('${book.getBook_id()}')" class="truncate book-category">${book.name}</div>
                                        <div style="width: 100%">
                                            <div style="font-size: 80%">${book.author}</div>
                                        </div>
                                        <div style="display: flex;justify-content: center;margin-top: 5%;gap: 8%;">
                                            <div style="text-decoration: line-through;color: #9E9E9E;">
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
                                        <button onclick="getDetails('${book.getBook_id()}')" style="width: 100%;border: none;margin-bottom: 10%;margin-top: 7%;background-color: #008CFA;padding: 5px;border-radius: 10px;color: white">Mua Ngay</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div style="display: flex; justify-content: center; gap: 0.5%;">
                <c:if test="${requestScope.pageControl.page > 1}">
                    <div class="prev" onclick="prevPageButton('${requestScope.pageControl.page}', '${requestScope.pageControl.urlPattern}')" style="min-width: 40px; height: 30px; display: block; line-height: 30px; text-align: center; cursor: pointer; color: #999999; box-shadow: 0px 0px 10px rgba(0,0,0,0); background-color: white; border: 1px solid #999999; transition: background-color 0.3s ease;" onmouseover="this.style.backgroundColor = '#CCCCCC'; this.style.color = '#5E7F9D';" onmouseout="this.style.backgroundColor = 'white'; this.style.color = '#999999';"><</div>
                </c:if>
                <c:forEach var="index" begin="1" end="${requestScope.pageControl.totalPage}">
                    <c:if test="${requestScope.pageControl.totalPage > 1}">
                        <c:choose>
                            <c:when test="${index == requestScope.pageControl.page}">
                                <a style="text-decoration: none;color: white;min-width: 40px;height: 30px;display: block;line-height: 30px;text-align: center;background-color: #00A5F0" href="category${requestScope.pageControl.urlPattern}page=${index}">${index}</a> 
                            </c:when>
                            <c:otherwise>
                                <a class="pageContent" href="category${requestScope.pageControl.urlPattern}page=${index}" style="text-decoration: none;color: #999999;min-width: 40px;height: 30px;display: block;line-height: 30px;text-align: center;box-shadow: 0px 0px 10px rgba(0,0,0,0);border: 1px solid #999999; background-color: #FFFFFF; transition: background-color 0.3s ease;" onmouseover="this.style.backgroundColor = '#CCCCCC'; this.style.color = '#5E7F9D';" onmouseout="this.style.backgroundColor = '#FFFFFF'; this.style.color = '#999999';">
                                    ${index}
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>
                <c:if test="${requestScope.pageControl.page lt requestScope.pageControl.totalPage && requestScope.pageControl.totalPage > 1}">
                    <div class="next" onclick="nextPageButton('${requestScope.pageControl.page}', '${requestScope.pageControl.totalPage}', '${requestScope.pageControl.urlPattern}')" style="min-width: 40px; height: 30px; display: block; line-height: 30px; text-align: center; cursor: pointer; box-shadow: 0px 0px 10px rgba(0,0,0,0); background-color: white; border: 1px solid #999999; color: #999999; transition: background-color 0.3s ease;" onmouseover="this.style.backgroundColor = '#CCCCCC'; this.style.color = '#5E7F9D';" onmouseout="this.style.backgroundColor = 'white'; this.style.color = '#999999';">></div>
                </c:if>
            </div>
        </div>
        <%@include file="common/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/js/category.js"></script>
    </body>
</html>
