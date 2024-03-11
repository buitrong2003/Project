<%-- 
    Document   : category
    Created on : Mar 4, 2024, 10:34:33 PM
    Author     : d
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>SB Admin - Dashboard</title>
        <!-- Custom fonts for this template-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Page level plugin CSS-->
        <link href="../css/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="../css/colReorder-bootstrap4.css"/>
        <script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
        <!-- CKFinder -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.16.1/plugins/ckfinder/ckfinder.js"></script>

        <style>
            * {
                margin: 0;
                padding: 0;
                font-family: sans-serif;
            }
            .chartMenu {
                width: 100vw;
                height: 40px;
                background: #1a1a1a;
                color: rgba(54, 162, 235, 1);
            }
            .chartMenu p {
                padding: 10px;
                font-size: 20px;
            }
            .chartCard {
                width: 100vw;
                height: calc(100vh - 40px);
                display: flex;
                align-items: center;
                margin-left: 15%
            }
            .chartBox {
                width: 700px;
                padding: 20px;
                border-radius: 20px;
                border: solid 3px rgba(54, 162, 235, 1);
                background: white;
            }
        </style>
    </head>
    <body>
        <%@include file="../common/admin/navbar.jsp" %>
        <div id="wrapper">
            <%@include file="../common/admin/sideBar.jsp" %>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <%@include file="../common/admin/breadcategory.jsp" %>
                    <!-- Icon Cards-->
                    <%@include file="../common/admin/iconCard.jsp" %>
                    <div>Total Amount:
                        <script>
                            var newPrice =  ${totalAmount};
                            var formattedPrice = newPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
                            formattedPrice = formattedPrice.replace(/,/g, '.');
                            document.write('₫' + formattedPrice);
                        </script>
                    </div>
                    <div class="card mb-2">
                        <div class="chartCard">
                            <div class="chartBox">
                                <canvas id="myChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="../common/admin/footer.jsp" %>
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>
            <!-- Logout Modal-->
            <%@include file="../common/admin/logoutModal.jsp" %>
            <!-- Bootstrap core JavaScript-->
            <script src="../js/admin/jquery.min.js"></script>
            <script src="../js/admin/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="../js/admin/jquery.easing.min.js"></script>
            <!-- Page level plugin JavaScript-->
            <script src="../js/admin/Chart.min.js"></script>
            <script src="../js/admin/jquery.dataTables.js"></script>
            <script src="../js/admin/dataTables.bootstrap4.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../js/admin/sb-admin.min.js"></script>
            <script src="../js/admin/colReorder-bootstrap4-min.js"></script>
            <script src="../js/admin/colReorder-dataTables-min.js"></script>
            <!-- Demo scripts for this page-->
            <script src="../js/admin/datatables-demo.js"></script>
            <script src="../js/admin/chart-area-demo.js"></script>
            <script src="../js/admin/colReorder-dataTables-min.js"></script>
            <script src="../js/admin/colReorder-bootstrap4-min.js"></script>
            <script
                type="text/javascript"
                src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"
            ></script>
            <script>
                            // setup
                            var data = {
                                labels: [],
                                datasets: [{
                                        label: "Weekly Sales",
                                        data: new Array(12).fill(0),
                                        backgroundColor: [
                                            "rgba(255, 26, 104, 0.2)",
                                            "rgba(54, 162, 235, 0.2)",
                                            "rgba(255, 206, 86, 0.2)",
                                            "rgba(75, 192, 192, 0.2)",
                                            "rgba(153, 102, 255, 0.2)",
                                            "rgba(255, 159, 64, 0.2)",
                                            "rgba(0, 0, 0, 0.2)"
                                        ],
                                        borderColor: [
                                            "rgba(255, 26, 104, 1)",
                                            "rgba(54, 162, 235, 1)",
                                            "rgba(255, 206, 86, 1)",
                                            "rgba(75, 192, 192, 1)",
                                            "rgba(153, 102, 255, 1)",
                                            "rgba(255, 159, 64, 1)",
                                            "rgba(0, 0, 0, 1)"
                                        ],
                                        borderWidth: 1
                                    }]
                            };
                <c:forEach var="i" begin="1" end="12">
                            data.labels.push("Tháng " + ${i});
                    <c:forEach items="${listStatistical}" var="statistical">
                        <c:choose>
                            <c:when test="${statistical.month == i}">
                            data.datasets[0].data.splice(${i-1}, 0, ${statistical.totalAmount});
                            </c:when>
                            <c:otherwise>
                            data.datasets[0].data.splice(${i-1}, 0, 0);
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </c:forEach>
                            // config
                            const config = {
                                type: "bar",
                                data,
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true,
                                        },
                                    },
                                },
                            };
                            // render init block
                            const myChart = new Chart(document.getElementById("myChart"), config);
                            // Instantly assign Chart.js version
                            const chartVersion = document.getElementById("chartVersion");
                            chartVersion.innerText = Chart.version;
            </script>
        </div>
    </body>
</html>
