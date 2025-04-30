chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
    if (message.action === "newAnime") {
        chrome.storage.local.set({ popupData: message.data });
    }
    if (message.action === "timeCode") {
        chrome.storage.local.set({ popupData: message.data });
    }
});
