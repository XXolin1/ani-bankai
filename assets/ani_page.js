//let crayon = document.getElementById('crayon');
//let modif_menu = document.getElementById('modif_menu');
//
//modif_menu.style.display = 'none';
//
//crayon.addEventListener('click', function() {
//    if (modif_menu.style.display === 'block') {
//        modif_menu.style.display = 'none';
//    } else {
//        modif_menu.style.display = 'block';
//    }
//});

let original_name = document.getElementById('original_name');

function shorten_text(original_name) {     // version 1.0
    let width =  original_name.offsetWidth;
    if (width > 45) {
        console.log("width : " + width);
        for (caractere of original_name.innerHTML) {
            if (width > 45) {
                width = original_name.offsetWidth;
                original_name.innerHTML = original_name.innerHTML.slice(0, -1);
                console.log(original_name.innerHTML);
            }
        }
        if (width <= 45) {
            original_name.innerHTML += "...";
            
        }
        console.log("width : " + width);
    }
}

shorten_text(original_name);