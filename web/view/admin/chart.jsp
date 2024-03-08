<%-- 
    Document   : newjsp
    Created on : Mar 8, 2024, 1:31:28 PM
    Author     : d
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <body>
        <div
            id="myChart" style="width:100%; max-width:600px; height:500px;">
        </div>
        <script>
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Book');
                data.addColumn('number', 'Mhl');
            <c:forEach items="${listBook}" var="book">
                data.addRow(['${book.name}', ${book.book_hot}]);
            </c:forEach>
                const options = {
                    title: 'World Wide Wine Production'
                };
                const chart = new google.visualization.PieChart(document.getElementById('myChart'));
                chart.draw(data, options);
            }
        </script>
    </body>
</html>

