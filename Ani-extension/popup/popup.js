
let title = document.getElementById('title');
let time = document.getElementById('time');


console.log("Popup.js");

chrome.runtime.onMessageExternal.addListener(
    function(request, sender, sendResponse) {
        console.log("Popup.js : Message reçu : ", request);
        let test = getElementById('output');
        test.textContent = request;
    });

// TEST AVEC CHAT GPT

// 1. Établir une connexion avec le service worker
const port = chrome.runtime.connect({ name: "popup" });
console.log("[Popup] Connexion au service worker établie");

// 2. Écouter les messages du service worker
port.onMessage.addListener((message) => {
    alert("test");
    console.log("Message reçu depuis le service worker :", message);

    // Vérifier le type d'action et mettre à jour l'affichage si nécessaire
    if (message.action === "update") {
        // Exemple : mise à jour d'un élément HTML dans la popup
        const outputElement = document.getElementById("output");
        if (outputElement) {
            outputElement.textContent = message.data;
            alert("j suis la !!!")
        }
    }
});

port.postMessage({ action: "popupReady" });


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



//// 2. Écouter les messages du service worker
//port.onMessage.addListener((message) => {
//    console.log("[Popup] Message reçu depuis le service worker:", message);
//
//    // Vérifier le type d'action et mettre à jour l'affichage si nécessaire
//    if (message.action === "update") {
//        // Exemple : mise à jour d'un élément HTML dans la popup
//        const outputElement = document.getElementById("output");
//        if (outputElement) {
//            outputElement.textContent = message.data;
//            alert("j suis la !!!")
//        }
//    }
//});


