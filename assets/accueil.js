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

animeDetails.addEventListener("mouseenter", () => {
    
})


//})





