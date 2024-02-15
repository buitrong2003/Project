<%-- 
    Document   : shoppingcart
    Created on : Feb 15, 2024, 10:32:15 PM
    Author     : d
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" rel="stylesheet" />
        <style>
            body{
                background: #ddb5b5;
            }
            .cart{
                margin: 20px 0;
                background-color: #F6F5FA;
                ;
                padding: 60px 0;
            }
            .total-price{
                padding-bottom: 15px;
            }
            .cart-item{
                background-color: #fff;
                border-radius: 10px;
                padding: 15px 20px;
                margin-bottom: 20px;
            }
            .center-item{
                display: flex;
                align-items: center;
                justify-content: flex-start;
            }
            .cart-item img{
                width: 115px;
            }
            .cart-item h5{
                padding: 0 10%;
            }
            .cart-item .remove-item{
                width: 25px!important;
            }
            .btn-default{
                background-color: #fff;
            }
            .cart-item .form-control{
                background-color: #F6F5FA;
                border: none;
                width: 65px;
                border-radius: 10px!important;
                font-weight: 700;
                font-size: 20px;
            }
            .input-group{
                width: unset;
                flex-wrap: nowrap;
            }
            .status{
                text-align: right;
            }
            .check-out{
                float: right;
                padding: 10px 30px;
                font-size: 19px;
                background-color: #2FBE70;
                border: none;
            }
        </style>
    </head>
    <body>
        <section>
            <div class="container">
                <h2 class="px-5 p-2">My shopping cart</h2>
                <div class="cart row">
                    <div class="col-md-9">
                        <div class="cart-item">
                            <c:forEach items="${requestScope.listBookCart}" var="bookCart">
                                <div style="margin-top: 5%;margin-bottom: 5%" class="row">
                                    <div class="col-md-6 center-item mx-auto">
                                        <img style="cursor: pointer" src="image/${bookCart.image}" alt="">
                                        <h5 style="cursor: pointer">${bookCart.name}</h5>
                                    </div>
                                    <div class="col-md-6 center-item">
                                        <div class="input-group number-spinner">
                                            <button id="case-minus" class="btn btn-default"><i class="fas fa-minus"></i></button>
                                            <input id="case-number" type="number" min="0" class="form-control text-center" value="1">
                                            <button id="case-plus" class="btn btn-default"><i class="fas fa-plus"></i></button>
                                        </div>
                                        <h5><span id="phone-total">
                                                <script>
                                                    var newPrice = ${bookCart.price};
                                                    var formattedPrice = newPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
                                                    formattedPrice = formattedPrice.replace(/,/g, '.');
                                                    document.write('₫' + formattedPrice);
                                                </script>
                                            </span> </h5>
                                        <img style="cursor: pointer" src="data:image/jpeg;base64,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" alt="" class="remove-item">
                                    </div>
                                </div>
                            </c:forEach>   
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="cart-item">
                            <div class="row">
                                <div style="font-weight: bold" class="col-md-5">
                                    <div>Name: </div>
                                    <div style="margin-top: 23%">Email: </div>
                                    <div style="margin-top: 25%">Address: </div>
                                </div>
                                <div class="col-md-7">
                                    <input style="width: 110%;margin-bottom: 10%;background-color: #F6F5FA;border: none;border-radius: 10px!important;font-weight: 700" type="text" />
                                    <input  style="width: 110%;margin-bottom: 10%;background-color: #F6F5FA;border: none;border-radius: 10px!important;font-weight: 700" type="email" />
                                    <input style="width: 110%;margin-bottom: 10%;background-color: #F6F5FA;border: none;border-radius: 10px!important;font-weight: 700" type="text" />
                                </div>
                            </div>
                        </div>
                        <div class="cart-item">                            
                            <div class="row">
                                <div style="text-align: left" class="col-md-5">
                                    <h5>Subtotal: </h5>
                                    <h5>Tax:</h5>
                                    <h5 style="margin-right: 10%">Total:</h5>
                                </div>
                                <div class="col-md-7">
                                    <h5>$<span id="sub-total">1,278</span></h5>
                                    <h5>$<span id="tax-amount">0</span></h5>
                                    <h5>$<span id="total-price">1,278</span></h5>
                                </div>
                            </div>
                        </div>
                        <div style="width: 70%;margin: auto">
                            <button type="button" class="btn btn-success check-out">Check Out</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            function upadateCaseNumber(product, price, isIncreasing) {
                const caseInput = document.getElementById(product + '-number');
                let caseNumber = caseInput.value;
                if (isIncreasing) {
                    caseNumber = parseInt(caseNumber) + 1;
                } else if (caseNumber > 0) {
                    caseNumber = parseInt(caseNumber) - 1;
                }

                caseInput.value = caseNumber;
                // update case total 
                const caseTotal = document.getElementById(product + '-total');
                caseTotal.innerText = caseNumber * price;
                calculateTotal();
            }


            function getInputvalue(product) {
                const productInput = document.getElementById(product + '-number');
                const productNumber = parseInt(productInput.value);
                return productNumber;
            }
            function calculateTotal() {
                const phoneTotal = getInputvalue('phone') * 1219;
                const caseTotal = getInputvalue('case') * 59;
                const subTotal = phoneTotal + caseTotal;
                const tax = subTotal / 10;
                const totalPrice = subTotal + tax;

                // update on the html 
                document.getElementById('sub-total').innerText = subTotal;
                document.getElementById('tax-amount').innerText = tax;
                document.getElementById('total-price').innerText = totalPrice;

            }





            document.getElementById('case-plus').addEventListener('click', function () {
                // const caseInput = document.getElementById('case-number');
                // const caseNumber = caseInput.value;
                // caseInput.value = parseInt(caseNumber) + 1;
                upadateCaseNumber('case', 59, true);
            });

            document.getElementById('case-minus').addEventListener('click', function () {
                // const caseInput = document.getElementById('case-number');
//     const caseNumber = caseInput.value;
//    if(caseInput.value > 1){
//         caseInput.value = parseInt(caseNumber) - 1;
//    }
                upadateCaseNumber('case', 59, false);
            });

// phone prcie update using add event linstner 
            document.getElementById('phone-plus').addEventListener('click', function () {
                upadateCaseNumber('phone', 1219, true);
            });


            document.getElementById('phone-minus').addEventListener('click', function () {
                upadateCaseNumber('phone', 1219, false);
            });
        </script>
    </body>
</html>
