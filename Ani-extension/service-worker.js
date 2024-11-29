// This is the service worker script, which executes in its own context
// when the extension is installed or refreshed (or when you access its console).
// It would correspond to the background script in chrome extensions v2.

console.log("This prints to the console of the service worker (background script)")

// Importing and using functionality from external files is also possible.
importScripts('service-worker-utils.js')

// If you want to import a file that is deeper in the file hierarchy of your
// extension, simply do `importScripts('path/to/file.js')`.
// The path should be relative to the file `manifest.json`.


// TEST VIA CHAT GPT

let popupPort = null;

// Écouter les connexions depuis le popup
chrome.runtime.onConnect.addListener((port) => {
    if (port.name === "popup") {
        popupPort = port;

        // Nettoyer la référence si le popup est fermé
        port.onDisconnect.addListener(() => {
            popupPort = null;
        });
    }
});

// Relayer les messages depuis foreground.js vers le popup
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
    if (message.type === "updatePopup" && popupPort) {
        popupPort.postMessage({ action: "update", data: message.data });
    }
    sendResponse({ status: "Message relayé" });
});
