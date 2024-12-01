// This is the service worker script, which executes in its own context
// when the extension is installed or refreshed (or when you access its console).
// It would correspond to the background script in chrome extensions v2.

console.log("This prints to the console of the service worker (background script)")

// Importing and using functionality from external files is also possible.
importScripts('service-worker-utils.js')

// If you want to import a file that is deeper in the file hierarchy of your
// extension, simply do `importScripts('path/to/file.js')`.
// The path should be relative to the file `manifest.json`.

// ID : hiabjpjjljjfjjeinealgdmodpljpifm


let popupPort = null;

// ---------------------- ca c'est ok !! ----------------------

console.log("Service worker");


chrome.runtime.onConnect.addListener((port) => {
    console.log("[Service Worker] Connexion reçue depuis:", port.name);

    if (port.name === "popup") {
        popupPort = port;
        console.log("[Service Worker] popupPort initialisé:", popupPort);

        // Gérer la déconnexion
        port.onDisconnect.addListener(() => {
            console.log("[Service Worker] Popup déconnecté");
            popupPort = null;
        });
    } else {
        console.warn("[Service Worker] Connexion inconnue ignorée:", port.name);
    }
});

// ---------------------- ------------- ----------------------

console.log("j'ai fini la recup du port et tt");

// Écoute les messages et envoie
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
    console.log("[Service Worker] Message reçu:", message);

    if (message.type === "update" && popupPort) {
        console.log("[Service Worker] Envoi du message au popup via popupPort");
        popupPort.postMessage({ action: "update", data: message.data });
    } else {
        console.warn("[Service Worker] Message ignoré (popupPort non initialisé ou type incorrect)");
    }

    sendResponse({ status: "Message reçu et traité" });
});




//// Écoute les messages de la popup
//port.onMessage.addListener((msg) => {
//    console.log("[Service Worker] Message reçu de la popup:", msg);
//    // recevoir check si la popup a bien recu le message
//});