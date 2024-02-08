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
//const next = document.querySelector('.next');
//const prev = document.querySelector('.prev');
//const comment = document.querySelector('#list-comment');
//const commentItem = document.querySelectorAll('#list-comment .item');
//var translateY = 0;
//var count = commentItem.length;
//
//next.addEventListener('click', function (event) {
//    event.preventDefault();
//    if (count === 1) {
//        // Xem hết bình luận
//        return false;
//    }
//    translateY += -400;
//    comment.style.transform = `translateY(${translateY}px)`;
//    count--;
//});
//
//prev.addEventListener('click', function (event) {
//    event.preventDefault();
//    if (count === 3) {
//        // Xem hết bình luận
//        return false;
//    }
//    translateY += 400;
//    comment.style.transform = `translateY(${translateY}px)`;
//    count++;
//});



