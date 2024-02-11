<%-- 
    Document   : details
    Created on : Feb 5, 2024, 8:58:10 PM
    Author     : d
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap');

            *{
                box-sizing: border-box;
                padding: 0;
                margin: 0;
                font-family: 'Open Sans', sans-serif;
            }
            body{
                line-height: 1.5;
            }
            .card-wrapper{
                max-width: 1100px;
                margin: 0 auto;
            }
            img{
                width: 100%;
                display: block;
            }

            .img-showcase{
                width: 100%;
            }
            .img-showcase img{
                border-radius: 6px;
            }
            .img-select{
                display: flex;
            }
            .img-item{
                margin: 0.3rem;
            }
            .img-item:nth-child(1),
            .img-item:nth-child(2),
            .img-item:nth-child(3){
                margin-right: 0;
            }
            .img-item:hover{
                opacity: 0.8;
            }
            .product-content{
                padding: 2rem 1rem;
            }

            .product-link{
                text-decoration: none;
                text-transform: uppercase;
                font-weight: 400;
                font-size: 0.9rem;
                display: inline-block;
                margin-bottom: 0.5rem;
                background: #256eff;
                color: #fff;
                padding: 0 0.3rem;
                transition: all 0.5s ease;
            }
            .product-link:hover{
                opacity: 0.9;
            }
            .product-rating{
                color: #ffc107;
            }
            .product-rating span{
                font-weight: 600;
                color: #252525;
            }
            .product-price{
                margin: 1rem 0;
                font-size: 1rem;
                font-weight: 700;
            }
            .product-price span{
                font-weight: 400;
            }
            .last-price span{
                color: #f64749;
                text-decoration: line-through;
            }
            .new-price span{
                color: #256eff;
            }
            .product-detail h2{
                text-transform: capitalize;
                color: #12263a;
                padding-bottom: 0.6rem;
            }
            .product-detail p{
                font-size: 0.9rem;
                padding: 0.3rem;
                opacity: 0.8;
            }
            .product-detail ul{
                margin: 1rem 0;
                font-size: 0.9rem;
            }
            .product-detail ul li{
                margin: 0;
                list-style: none;
                background: url(shoes_images/checked.png) left center no-repeat;
                background-size: 18px;
                padding-left: 1.7rem;
                margin: 0.4rem 0;
                font-weight: 600;
                opacity: 0.9;
            }
            .product-detail ul li span{
                font-weight: 400;
            }
            .purchase-info{
                margin: 1.5rem 0;
            }
            .purchase-info input,
            .purchase-info .btn{
                border: 1.5px solid #ddd;
                border-radius: 25px;
                text-align: center;
                padding: 0.45rem 0.8rem;
                outline: 0;
                margin-right: 0.2rem;
                margin-bottom: 1rem;
            }
            .purchase-info input{
                width: 60px;
            }
            .purchase-info .btn{
                cursor: pointer;
                color: #fff;
            }
            .purchase-info .btn:first-of-type{
                background: #256eff;
            }
            .purchase-info .btn:last-of-type{
                background: #f64749;
            }
            .purchase-info .btn:hover{
                opacity: 0.9;
            }
            .social-links{
                display: flex;
                align-items: center;
            }
            .social-links a{
                display: flex;
                align-items: center;
                justify-content: center;
                width: 32px;
                height: 32px;
                color: #000;
                border: 1px solid #000;
                margin: 0 0.2rem;
                border-radius: 50%;
                text-decoration: none;
                font-size: 0.8rem;
                transition: all 0.5s ease;
            }
            .social-links a:hover{
                background: #000;
                border-color: transparent;
                color: #fff;
            }

            @media screen and (min-width: 992px){
                .card{
                    display: grid;
                    grid-template-columns: repeat(2, 1fr);
                    grid-gap: 1.5rem;
                    margin-top: 120%;
                }
                .card-wrapper{
                    height: 100vh;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .product-content{
                    padding-top: 0;
                }
            }
            .quantity-container {
                display: flex;
                border: 1px solid #ced4da;
                width: fit-content;
                border-radius: 0.25rem;
            }

            .quantity-input {
                width: 50px; /* Adjust as needed */
                text-align: center;
                border: none;
                padding: 0.375rem 0.75rem;
                margin: 0;
            }

            .quantity-button {
                background-color: #ffffff;
                border: none;
                padding: 0.375rem 0.75rem;
                cursor: pointer;
                user-select: none;
                -moz-user-select: none;
                -webkit-user-select: none;
                transition: background-color 0.1s ease-in-out;
            }

            .quantity-button:hover {
                background-color: #f8f9fa;
            }

            /* This is to remove the default spinner from input type number */
            /* Chrome, Safari, Edge, Opera */
            .quantity-input::-webkit-outer-spin-button,
            .quantity-input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            /* Firefox */
            .quantity-input[type=number] {
                -moz-appearance: textfield;
            }
        </style>
    </head>
    <body style=" background-color: #EBEBEB">
        <%@include file="header.jsp" %>
        <div class = "card-wrapper">

            <div style="margin-top: 20%" class = "row">
                <!-- card left -->
                <div class = "product-imgs col-md-6">
                    <div class = "img-display">
                        <div class = "img-showcase">
                            <img style="height: 75vh;width: 100%" 
                                 src="image/${requestScope.book.image}" class="imageDetails" alt = "shoe image">                        
                        </div>
                    </div>
                </div>
                <!-- card right -->
                <div class = "product-content col-md-6">
                    <h2 style="font-weight: bold;margin-top: 7%" class = "product-title">${requestScope.book.name}</h2>
                    <div>Tác giả: ${requestScope.book.author}</div>
                    <div class = "product-rating">
                        <i class = "fas fa-star"></i>
                        <i class = "fas fa-star"></i>
                        <i class = "fas fa-star"></i>
                        <i class = "fas fa-star"></i>
                        <i class = "fas fa-star-half-alt"></i>
                        <span>4.7(21)</span>
                    </div>
                    <div>Nhà xuất bản: ${requestScope.book.publisher}</div>
                    <div>Thể loại: ${requestScope.book.genre}</div>
                    <div>Mô tả: ${requestScope.book.description}</div>
                    <div class = "product-price">
                        <div style="display: flex">
                            <div>Giá cũ: </div>
                            <div style="text-decoration: line-through;color: red;margin-left: 2%" class = "new-price">
                                <script>
                                    var newPrice = ${book.price + 200000};
                                    var formattedPrice = newPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
                                    formattedPrice = formattedPrice.replace(/,/g, '.');
                                    document.write('₫' + formattedPrice);
                                </script>
                            </div>
                        </div>
                        <div style="display: flex">
                            <div>Giá mới: </div>
                            <div style="color: blue;margin-left: 2%" class = "new-price">
                                <script>
                                    var newPrice = ${book.price};
                                    var formattedPrice = newPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
                                    formattedPrice = formattedPrice.replace(/,/g, '.');
                                    document.write('₫' + formattedPrice);
                                </script>
                            </div>
                        </div>

                    </div>

                    <div class="quantity-container">
                        <input style="border: 1px solid #8A8B89" type="button" class="quantity-button" value="-" onclick="decreaseValue()">
                        <input class="quantity-input" type="number" min="0" max="${requestScope.changeNumber == null ? book.quantity : requestScope.changeNumber}" value="0" id="numberInput">
                        <input style="border: 1px solid #8A8B89"  type="button" class="quantity-button" value="+" onclick="increaseValue('${requestScope.changeNumber == null ? book.quantity : requestScope.changeNumber}')">
                    </div>
                    <div style="color: red" class="error">${requestScope.error}</div>
                    <div class = "purchase-info">
                        <button onclick="addToCart('${requestScope.book.getBook_id()}')" type = "button" class = "btn">
                            <input id="${requestScope.book.getBook_id()}" type="hidden" name="book" value="${requestScope.book}">
                            Add to Cart <i class = "fas fa-shopping-cart"></i>
                        </button>
                        <button type = "button" class = "btn">Compare</button>
                    </div>

                    <div class = "social-links">
                        <p>Share At: </p>
                        <a href = "#">
                            <i class = "fab fa-facebook-f"></i>
                        </a>
                        <a href = "#">
                            <i class = "fab fa-twitter"></i>
                        </a>
                        <a href = "#">
                            <i class = "fab fa-instagram"></i>
                        </a>
                        <a href = "#">
                            <i class = "fab fa-whatsapp"></i>
                        </a>
                        <a href = "#">
                            <i class = "fab fa-pinterest"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const imgs = document.querySelectorAll('.img-select a');
            const imgBtns = [...imgs];
            let imgId = 1;
            imgBtns.forEach((imgItem) => {
                imgItem.addEventListener('click', (event) => {
                    event.preventDefault();
                    imgId = imgItem.dataset.id;
                    slideImage();
                });
            });
            var addToCart = (id) => {
                let quantity = document.querySelector('.quantity-input').value;
                function parseBookString(inputString) {
                    let book = {};
                    inputString.match(/(\w+)=(.+?)(?=\s\w+=|$)/g).forEach(match => {
                        let [key, value] = match.split('=');
                        value = value.replace(/,/g, '');
                        if (key === 'book_id' || key === 'quantity' || key === 'category_id' || key === 'book_hot') {
                            book[key] = parseInt(value);
                        } else if (key === 'price') {
                            book[key] = parseFloat(value);
                        } else if (key === 'publication_date') {
                            if (value === '--') {
                                book[key] = null; 
                            } else {
                                const months = {'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04', 'May': '05', 'Jun': '06', 'Jul': '07', 'Aug': '08', 'Sep': '09', 'Oct': '10', 'Nov': '11', 'Dec': '12'};
                                const parts = value.split(' ');
                                const year = parts[5];
                                const month = months[parts[1]];
                                const day = parts[2];

                                const formattedDateString = year + "-" + month + "-" + day;
                                book[key] = formattedDateString;
                            }
                        } else {
                            book[key] = value;
                        }
                    });
                    return book;
                }
                let inputString = document.getElementById(id).value;
                let bookCart = parseBookString(inputString);
                let bookJSON = JSON.stringify(bookCart);
                let numberFruit = document.querySelector('.quantity-input');
                let numberChangeBook = numberFruit.max;
                let encodedBookJSON = encodeURIComponent(bookJSON);
                console.log(bookJSON);
                window.location.href = "cart?book=" + encodedBookJSON + "&quantityBook=" + quantity + "&numberChange=" + numberChangeBook;
            };

            function slideImage() {
                const displayWidth = document.querySelector('.img-showcase img:first-child').clientWidth;
                document.querySelector('.img-showcase').style.transform = `translateX(${- (imgId - 1) * displayWidth}px)`;
            }
            function increaseValue(max) {
                var inputElement = document.getElementById('numberInput');
                var value = parseInt(inputElement.value);
                value = isNaN(value) ? 0 : value;
                inputElement.max = max;
                if (value < max) {
                    value++;
                }
                let error = document.querySelector('.error');
                if (value === parseInt(max)) {
                    error.innerHTML = "Số lượng bạn chọn đã đạt mức tối đa của sản phẩm này";
                } else {
                    error.innerHTML = "";
                }

                inputElement.value = value;
            }
            function decreaseValue() {
                var value = parseInt(document.getElementById('numberInput').value, 10);
                value = isNaN(value) ? 0 : value;
                value < 1 ? value = 1 : '';
                value--;
                document.getElementById('numberInput').value = value;
            }
        </script>
    </body>
</html>
