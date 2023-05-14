/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
function checkForm(){
    var boolean = false;
    var rating = document.getElementById('rating').value;
    var views = document.getElementById('views').value;
    
    if( (rating !== '' || rating.length !== 0 || /^\d+$/.test(rating)) && (views !== '' || views.length !== 0 || /^\d+$/.test(views))) {
        if(rating > 0 || rating <10){
            boolean = true;
        }
    }
    console.log(boolean);
    sendData();
}

function sendData(){
    document.ejemploForm.action = "./destino.php";
    document.ejemploForm.method = "GET";
    document.ejemploForm.submit();
}

