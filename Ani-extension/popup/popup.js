
let title = document.getElementById('title');
let time = document.getElementById('time');

// second to m:s
function secondsToms(d) {
    d = Number(d);
    let m = Math.floor(d % 3600 / 60);
    let s = Math.floor(d % 3600 % 60);
    return m +":"+s;
}

// update time
function updateTime(t,tempsEp) {
    let prog = t/tempsEp*100;
    let bar = document.getElementById('bar');
    bar.value = prog;
    bar.textContent = `${prog}%`;
}

function VideoMode(){
    // display none everything
    let base = document.getElementById('base');
    console.log(base);
    base.style.display = "none";
    let vidmod = document.getElementById('VidMod');
    vidmod.style.display = "block";
}

console.log("Popup.js");

/*
chrome.runtime.onMessageExternal.addListener(
    function(request, sender, sendResponse) {
        console.log("Popup.js : Message reçu : ", request);
        let test = getElementById('output');
        test.textContent = request;
    });
*/

    
// -----------------------------------------------------------

// 1. Établir une connexion avec le service worker
const port = chrome.runtime.connect({ name: "popup" });
console.log("[Popup] Connexion au service worker établie sur le port :", port);
port.postMessage({ action: "popupReady" });
// -----------------------------------------------------------


document.addEventListener("DOMContentLoaded", () => {
    if (document.visibilityState === "visible") {
        // Envoyer un message au service worker pour indiquer que la popup est prête
        port.postMessage({ action: "popupReady" });
        console.log("[Popup] Message envoyé au service worker");
    }
});




// -----------------------------------------------------------

// 2. Écouter les messages du service worker
port.onMessage.addListener((message) => {
    //alert("test");
    console.log("Message reçu depuis le service worker :", message);

    // Vérifier le type d'action et mettre à jour l'affichage si nécessaire
    if (message.action === "update") {
        // Exemple : mise à jour d'un élément HTML dans la popup
        const title = document.getElementById("anime-title")

        if (title) {
            title.textContent = message.data;
        }
    }
    
    else if (message.action === "timecode") {
        
        const timecode = document.getElementById("timecode")

        if (timecode) {   
            timecode.textContent = message.data;
            //alert("j suis la !!!")
        }
        
    }
    else if (message.action === "video") {
        VideoMode();
    }
});


// -----------------------------------------------------------


// notification status 

const notifications = document.querySelectorAll('.notif');

// Ajoutez un événement à chaque bouton
notifications.forEach(notification => {
    notification.addEventListener('click', function () {
        // Vérifiez et changez le style uniquement pour le bouton cliqué
        if (this.style.backgroundImage.includes("bouton-notifications-colored.png")) {
            this.style.backgroundImage = "url('/images-extension/bouton-notifications.png')";
        } else {
            this.style.backgroundImage = "url('/images-extension/bouton-notifications-colored.png')";
        }
    });
});


// theme
let theme = document.getElementById('combox-back');
console.log(theme);

theme.addEventListener("change", () =>{
    console.log(theme.value);
    switch (theme.value) {
        
        case "1":
            document.body.style.background = "linear-gradient(to bottom right, #FFED68 0%, #38D4F8 100%)";
            break;
        case "2":
            document.body.style.background = "linear-gradient(to bottom right, #FF93F8 0%, #52BDFF 100%)";
            break;
        case "3":
            document.body.style.background = "linear-gradient(to bottom right, #FF4A4A 0%, #0CFE71 100%)";
            break;
        case "4":
            document.body.style.background = "linear-gradient(to bottom right, #36E43C 0%, #E2FF3E 100%)";
            break;
        case "5":
            document.body.style.background = "linear-gradient(to bottom right, #294DFF 0%, #FE951E 100%)";
            break;
        default:
            document.body.style.background = "linear-gradient(to bottom right, #FFED68 0%, #38D4F8 100%)";
    }


});




