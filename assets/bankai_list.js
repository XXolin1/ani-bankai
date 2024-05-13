let crayon = document.getElementById('crayon');
let modif_menu = document.getElementById('modif_menu');

modif_menu.style.display = 'none';

crayon.addEventListener('click', function() {
    if (modif_menu.style.display === 'block') {
        modif_menu.style.display = 'none';
    } else {
        modif_menu.style.display = 'block';
    }
});