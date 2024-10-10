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



function shorten_text() {     // version 1.0


    let title_bloc = document.getElementById('title_bloc')
    let title = document.getElementById('title');
    let original_name = document.getElementById('original_name');

    let width_title_bloc =  title_bloc.offsetWidth;
    let width_title = title.offsetWidth;
    let width_original_name = original_name.offsetWidth;

    let offset_index = 20;
    let stack_carac = '';

    console.log("width_title_bloc : " + width_title_bloc);
    console.log("width_title : " + width_title);
    console.log("width_original_name : " + width_original_name);

    width = width_title_bloc - width_title;

    console.log("width : " + width);

    if (width_original_name + offset_index > width) {

        

            if (width_original_name + offset_index > width) {
                width_original_name = original_name.offsetWidth;
                original_name.innerHTML = original_name.innerHTML.slice(0, -1);
                console.log(original_name.innerHTML);
            }

        
        if (width_original_name + offset_index <= width) {
            original_name.innerHTML += "...";
            console.log("widaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            
        }
        console.log("width : " + width_original_name);
    }
}

shorten_text();

window.addEventListener('resize', shorten_text);