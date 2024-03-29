/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function validateForm() {
    var name = document.getElementById("name").value.trim();
    var email = document.getElementById("email").value.trim();
    var phone = document.getElementById("phone").value.trim();
    var address = document.getElementById("address").value.trim();
    var isValid = true;
    if (name === "") {
        document.getElementById("nameError").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("nameError").style.display = "none";
    }
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        document.getElementById("emailError").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("emailError").style.display = "none";
    }
    var phonePattern = /^\d{10,11}$/;
    if (!phonePattern.test(phone)) {
        document.getElementById("phoneError").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("phoneError").style.display = "none";
    }

    if (address === "") {
        document.getElementById("addressError").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("addressError").style.display = "none";
    }
    return isValid;
}
var getSubmitCheckout = (e) => {
    let isvalid = validateForm();
    let formSubmit = document.querySelector('.check-out-submit');
    var totalMoney = parseInt(document.getElementById("total-price").textContent.trim());
    if (totalMoney <= 0 || !isvalid) {
        e.preventDefault(); // Ngăn chặn hành động mặc định của sự kiện
    } else {
        formSubmit.submit(); // Submit form
    }
};

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
        window.location.href = `process?id=${id}&quantity=${newValue}`;
    }
};
var minusQuantity = (id) => {
    var input = document.getElementById('case-number' + id);
    var minValue = 0;
    var currentValue = parseInt(input.value);
    if (currentValue > minValue) {
        input.value = currentValue - 1;
        let newValue = currentValue - 1;
        window.location.href = `process?id=${id}&quantity=${newValue}`;
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
var getDelete = (id) => {
    window.location.href = 'cart?id=' + id;
};

