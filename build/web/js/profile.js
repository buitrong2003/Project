/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function openFileUploader() {
    document.getElementById('uploadInput').click();
}
document.getElementById('uploadInput').addEventListener('change', function (e) {
    var canvas = document.getElementById('canvas');
    var ctx = canvas.getContext('2d');
    var img = new Image();
    var file = e.target.files[0];
    var reader = new FileReader();

    reader.onload = function () {
        img.onload = function () {
            canvas.width = img.width;
            canvas.height = img.height;
            ctx.drawImage(img, 0, 0);
            document.getElementById('avatar').src = canvas.toDataURL();
        };
        img.src = reader.result;
    };
    reader.readAsDataURL(file);
});

