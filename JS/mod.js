/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
function checkForm(){
    var boolean = false;
    var movie = document.getElementById('movies').options[document.getElementById('movies').selectedIndex].text;
    var rating = document.getElementById('rating').value;
    var views = document.getElementById('views').value;
    var platforms;
    
    if( (rating !== '' || rating.length !== 0 || /^\d+$/.test(rating)) && (views !== '' || views.length !== 0 || /^\d+$/.test(views))) {
        if(rating > 0 || rating <10){
            boolean = true;
        }
    }

    if(boolean){
        
        var data = [
            movie,
            rating,
            views
        ];
        console.log(data);
           
    }
}

function sendData(data) {
    var xhr = new XMLHttpRequest();

    //👇 set the PHP page you want to send data to
    xhr.open("POST", "index.php", true);
    xhr.setRequestHeader("Content-Type", "application/json");

    //👇 what to do when you receive a response
    xhr.onreadystatechange = function () {
        if (xhr.readyState == XMLHttpRequest.DONE) {
            alert(xhr.responseText);
        }
    };

    //👇 send the data
    xhr.send(JSON.stringify(data));
}

