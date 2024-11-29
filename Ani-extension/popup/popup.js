let title = document.getElementById('title');
let time = document.getElementById('time');

title.textContent = 'New Title AAA';

console.log("Popup.js");

// TEST AVEC CHAT GPT

// 1. Établir une connexion avec le service worker
const port = chrome.runtime.connect({ name: "popup" });

// 2. Écouter les messages du service worker
port.onMessage.addListener((message) => {
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





