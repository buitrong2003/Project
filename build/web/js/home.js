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




