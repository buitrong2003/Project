/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
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
function getCookie(cookieName) {
    var name = cookieName + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var cookieArray = decodedCookie.split(';');
    for (var i = 0; i < cookieArray.length; i++) {
        var cookie = cookieArray[i];
        while (cookie.charAt(0) === ' ') {
            cookie = cookie.substring(1);
        }
        if (cookie.indexOf(name) === 0) {
            return cookie.substring(name.length, cookie.length);
        }
    }
    return "";
}

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
            } else {
                book[key] = value;
            }
        });
        return book;
    }
    let inputString = document.getElementById(id).value;
    let bookCart = parseBookString(inputString);
    let bookJSON = JSON.stringify(bookCart);
    let encodedBookJSON = encodeURIComponent(bookJSON);
    console.log(bookJSON);
    let addCart = document.querySelector('.addCart');
    let bookDetails = document.querySelector('.bookDetails');
    let quantityDetails = document.querySelector('.quantityDetails');
    bookDetails.value = encodedBookJSON;
    quantityDetails.value = quantity;
    addCart.submit();
};

function slideImage() {
    const displayWidth = document.querySelector('.img-showcase img:first-child').clientWidth;
    document.querySelector('.img-showcase').style.transform = `translateX(${-(imgId - 1) * displayWidth}px)`;
}
function increaseValue(max) {
    var inputElement = document.getElementById('numberInput');
    var value = parseInt(inputElement.value);
    value = isNaN(value) ? 0 : value;
    inputElement.max = max;
    if (value < parseInt(max)) {
        value++;
    }
    let error = document.querySelector('.error');
    if (value >= parseInt(max)) {
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

