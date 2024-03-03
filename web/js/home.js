/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
let imageWapper = document.querySelector('.image-wapper');
let images = document.querySelectorAll('.banner-image');
let change = -1;
let count = 1;
setInterval(() => {
    let width = images[0].offsetWidth;
    if (count === images.length) {
        count = 0;
    }
    imageWapper.style.transform = `translateX(${width * -1 * count}px)`;
    count++;
}, 4000);
function getChange(direction) {
    var container = document.getElementById('handleChange');
    // Calculate the scroll distance based on the width of the container divided by the number of images to show per "page"
    var scrollAmount = direction * (container.offsetWidth / 5); // Adjust the divisor based on how many books you want to move per click
    container.scrollBy({left: scrollAmount, behavior: 'smooth'});
}
function getDetailsHome(id) {
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
        book['status'] = book['status'].replace(/\)$/g, '');
        return book;
    }
    let inputString = document.getElementById(id).value;
    let book = parseBookString(inputString);
    let bookJSON = JSON.stringify(book);
    let url = "details?book=" + encodeURIComponent(bookJSON);
    window.location.href = url;
}






