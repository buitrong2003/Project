/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function updateCookie(bookId, newValue) {
    // Tên cookie cần được cập nhật
    var cookieName = "caseNumber" + bookId;
    // Thời gian hết hạn của cookie (ở đây tôi sẽ đặt cookie này hết hạn sau 1 giờ)
    //var expirationDate = new Date();
    //expirationDate.setTime(expirationDate.getTime() + (1 * 60 * 60 * 1000)); // 1 giờ
    // Cập nhật giá trị của cookie
    //";expires=" + expirationDate.toUTCString()
    document.cookie = cookieName + "=" + newValue  + ";path=/";
}
function nextPageButtonShoppingCart(page, limitPageCart) {
    const currentPage = parseInt(page);
    const limitPage = parseInt(limitPageCart);
    if (currentPage < limitPage) {
        getPage(currentPage + 1);
    }
}
function prevPageButtonShoppingCart(page) {
    const currentPage = parseInt(page);
    if (currentPage > 1) {
        getPage(currentPage - 1);
    }
}
function getPage(index) {
    let formIndex = document.getElementById(index);
    formIndex.submit();
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
    document.getElementById('sub-total').innerText = subTotal;
    document.getElementById('tax-amount').innerText = tax;
    document.getElementById('total-price').innerText = totalPrice;
}
var plusQuantity = (id) => {
    var input = document.getElementById('case-number' + id);
    var maxValue = parseInt(input.getAttribute('max'));
    var currentValue = parseInt(input.value);
    if (currentValue < maxValue) {
        input.value = currentValue + 1;
        let newValue = currentValue + 1;
        updateCookie(id, newValue);
    }
};
var minusQuantity = (id) => {
    var input = document.getElementById('case-number' + id);
    var minValue = 0;
    var currentValue = parseInt(input.value);
    if (currentValue > minValue) {
        input.value = currentValue - 1;
        let newValue = currentValue - 1;
        updateCookie(id, newValue);
    }
};
var getPriceBook = (price, id) => {
    const phoneTotal = document.getElementById('phone-total' + id);
    let quantity = document.getElementById('case-number' + id);
    let totalPrice = parseInt(price) * parseInt(quantity.value);
    var formattedPrice = totalPrice.toLocaleString('en-US', {minimumFractionDigits: 0});
    formattedPrice = formattedPrice.replace(/,/g, '.');
    phoneTotal.innerHTML = '₫' + formattedPrice;
};
var getDelete = (id, page) => {
    window.location.href = 'cart?id=' + id + '&page=' + page;
};

