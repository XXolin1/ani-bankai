/*
//document.addEventListener("DOMContentLoaded", (event) => {

let scrollDownButton = document.getElementById('scrolldown');
scrollDownButton.addEventListener('click', scrollToBottom);

let scrollUpButton = document.getElementById('scrollup');
scrollUpButton.addEventListener('click', scrollToUp);

// Fonction pour déplacer la page vers le bas de manière animée
function scrollToBottom() {
    window.scroll({
        behavior: "smooth",
        top: 1000,
    })
}


function scrollToUp() {
    window.scroll({
        behavior: "smooth",
        top: 0,
    })
}





let clickProfil = document.getElementById('profil');
clickProfil.addEventListener('click', fProfil);

let etat = 0;

function fProfil(clickProfil) {
    let tkt = document.querySelector('#popProfil');
    
    let startTime;  // enregistrer le moment où l'animation a commencé

    // Déclencher l'animation lorsque la page est chargée

    var monElement = document.getElementById("popProfil");

    // Récupérer la valeur actuelle de left
    var valeurLeft = parseFloat(window.getComputedStyle(tkt).getPropertyValue("left"));


    switch (etat) {

        case 0:
            requestAnimationFrame(animer);
            break;

        case 1:
            requestAnimationFrame(animer_1);
            break;
    }



    // Partie a opimiser quand je saurai mieux faire des classes en JS.
    function animer(time) {

        if (!startTime) {
            startTime = time;  // time mesure le temps écoulé depuis le début de l'animation
            tkt.style.display = "block";
        }

        var progress = (time - startTime) / 50; // Durée de l'animation en secondes
        var translateX = Math.min(progress * 100, 305); // Déplacement lateral

        tkt.style.transform = 'translateX(' + -translateX + 'px)';

        

        if (translateX < 305) {
            requestAnimationFrame(animer);
        } 
        else {
            etat = 1;
            startTime = null;
        }
        console.log(valeurLeft);
    }
    


    function animer_1(time) {

        if (!startTime) {
            startTime = time;  // time mesure le temps écoulé depuis le début de l'animation
        }

        var progress = (time - startTime) / 50; // Durée de l'animation en secondes
        var translateX = Math.min(progress * 100, 305); // Déplacement lateral

        tkt.style.transform = 'translateX(' + (-305 + translateX) + 'px)';

        //var nouvelleValeurLeft = valeurLeft + translateX; // Mettez la nouvelle valeur que vous souhaitez
        //monElement.style.left = nouvelleValeurLeft;

        if (translateX < 305) {
            requestAnimationFrame(animer_1); // crée une boucle d'animation fluide
        } 
        else 
        {
            etat = 0;
            startTime = null;
            tkt.style.display = "none";
        }
        console.log(etat);
    }
}

*/



let animeDetails = document.getElementById('animeDetails');

window.addEventListener('load', function () {
    getColor(document.querySelector("body"));
  })

animeDetails.addEventListener("mouseenter", () => {
    
})


function getColor(sourceImage){
    // Get the source element's style
    var style = sourceImage.currentStyle || window.getComputedStyle(sourceImage, false)
    // isolate the source element's url
    var bi = style.backgroundImage.slice(4, -1).replace(/"/g, "");
    // Create a new Image object
    const img = new Image();
    // Set the new image object's url as the source url
    img.src = bi;

    // Selects the element we want to change the color of
    let background = document.querySelector("nav");
    // Initialize the ColorThief element
    let colorThief = new ColorThief();
    // Get the dominant color of the source image
    let color = colorThief.getColor(img);
    let palette = colorThief.getPalette(img);
    // Sets the background color and remove the background image
    background.style.backgroundColor = "rgba(" + color + ",0.90)";
    background.style.backgroundImage = 'none';
    console.log(color);
    console.log(palette);
    sortbrightness(palette);
}

function sortbrightness(a) {
    let brarray = [];
    a.forEach(element => {
        let br = 0.2126*parseInt(element[0])+0.7152*parseInt(element[1])+0.0722*parseInt(element[2]);
        brarray.push([br, element]);
    });
    console.log(brarray);
    brarray.sort();
    console.log(brarray);


}   

//})





