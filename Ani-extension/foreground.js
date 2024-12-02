// This script gets injected into any opened page
// whose URL matches the pattern defined in the manifest
// (see "content_script" key).
// Several foreground scripts can be declared
// and injected into the same or different pages.

//console.log('Foreground script running');
//console.log(location.href);

class anime {
  constructor() {
    this.name = "";
    this.title = "";
    this.episode = "";
    this.link = "";
  }
}

let animeCarac = new anime();
//

function crunchyroll(animeClass, host, callback) {
  // Find the title of the anime
  if (host == 'www.crunchyroll.com') {
    // Trouver le conteneur à observer
    let targetNode = document.getElementById('content');
    // Configuration de l'observateur
    let config = { childList: true, subtree: true };

    // Callback pour gérer les mutations
    let observerCallback = function (mutationsList, observer) {
      for (let mutation of mutationsList) {
        if (mutation.type === 'childList') {
          let titleNode = document.querySelector('h1');
          if (titleNode) {
            const h1 = titleNode.textContent.split(' - ');
            animeClass.episode = h1[0].substring(1);
            animeClass.title = h1[1];
            callback();
            observer.disconnect();
            break;
          }
        }
      }
    };

    // Création de l'observateur
    let observer = new MutationObserver(observerCallback);
    observer.observe(targetNode, config);
  }
  else if (host == 'static.crunchyroll.com') {
    let video = document.querySelector('video');
    video.addEventListener('timeupdate', () => {
      console.log(Math.floor(video.currentTime));
    });
  }
  else {
    console.log('Host not supported');
  }

}



console.log("URL : ", location.hostname, location.href);

//var views = chrome.extension.getViews({ type: "popup" }); juste comme ca

switch (location.hostname) {

  case 'v5.voiranime.com':
  case 'vidmoly.to':
  case 'u6lyxl0w.xyz':
    console.log("URL case iframe : ", location.hostname, location.href);
    voiranime(animeCarac);
    break;

  case 'www.crunchyroll.com':
  case 'static.crunchyroll.com':
    crunchyroll(anime, location.hostname, () => {
      // callback funct to save data
    });

    break;

  default:
    break;
}

function getAnimeCarac() {
  console.log("getAnimeCarac");

  let link = location.href;
}




function voiranime(animeClass) {

  if (location.hostname == 'v5.voiranime.com') {

    let link = location.href;
    let title = link.split("/")[4].split("-").join(" ");
    let episodeLink = link.split("/")[5];
    let episode = episodeLink.split("-")[4];
    let traduction = episodeLink.split("-")[5];

    animeCarac.title = title;

    console.log("Traduction : ", traduction, "Episode split : ", episodeLink.split("-"), "Title : ", title, "Link split : ", link.split("/"), "Link : ", link, "URL : ", location.hostname, location.href);
  }



  let video = document.querySelector('video');
  console.log("Video : ", video)
  video = document.querySelector('video');
  console.log("URL case iframe : ", location.hostname, location.href);

  console.log("ca skip ici c chiants");

  if (video != null) {
    console.log("Video : ", video);
    video.addEventListener('play', () => {

    });

    // video.duration;
    // video.currentTime;

    video.addEventListener('timeupdate', () => {
      console.log(Math.floor(video.currentTime));

      // test
      chrome.runtime.sendMessage(editorExtensionId, { type: "timecode", data: Math.floor(video.currentTime) }, (response) => {
        if (chrome.runtime.lastError) {
          console.error("Erreur lors de l'envoi du message :", chrome.runtime.lastError);
        } else {
          console.log("[Foreground] Réponse reçue du service worker :", response);
        }
      });
      // test
    });
  }

  //setInterval(() => {
  //sendMessageToPopup("le premier message dans un cas normal a peu pres MDRRRR AHAHAHA (PTN si zen voit ca...)");
  //}, 100);

  // --------------------- ok ---------------------

  chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
    if(animeCarac.title == "") return;
    console.log("Message reçu :", message);
    chrome.runtime.sendMessage(editorExtensionId, { type: "update", data: animeCarac.title }, (response) => {
      if (chrome.runtime.lastError) {
        console.error("Erreur lors de l'envoi du message :", chrome.runtime.lastError);
      } else {
        console.log("[Foreground] Réponse reçue du service worker :", response);
      }
    });
  })

  // --------------------- -- ---------------------

}


// The ID of the extension we want to talk to.
var editorExtensionId = "hiabjpjjljjfjjeinealgdmodpljpifm";

// Fonction pour vérifier la connexion de la popup
function checkPopupConnexion() {
  return new Promise((resolve) => {
    chrome.runtime.sendMessage(editorExtensionId, { type: "checkPopupConnection" }, (response) => {
      if (chrome.runtime.lastError) {
        console.error("[Foreground] Erreur :", chrome.runtime.lastError.message);
        resolve(false);
      } else {
        console.log("Connexion de la popup : ", response);
        resolve(response.isPopupConnected);
      }
    });
  });
}

// Fonction pour envoyer un message à la popup une fois qu'elle est connectée
async function sendMessageToPopup(message) {
  // Fonction pour attendre que la popup soit connectée
  async function waitForPopupConnection() {
    return new Promise((resolve) => {
      const interval = setInterval(async () => {
        const isPopupConnected = await checkPopupConnexion();
        if (isPopupConnected) {
          clearInterval(interval); // Arrêter l'interval une fois que la popup est connectée
          resolve(true); // La popup est connectée
        }
      }, 1000); // Vérifier toutes les secondes
    });
  }

  // Attendre que la popup soit connectée
  const popupConnected = await waitForPopupConnection();

  if (popupConnected) {
    // Envoie du message à la popup une fois qu'elle est connectée
    chrome.runtime.sendMessage(editorExtensionId, { type: "update", data: message }, (response) => {
      if (chrome.runtime.lastError) {
        console.error("Erreur lors de l'envoi du message :", chrome.runtime.lastError);
      } else {
        console.log("[Foreground] Réponse reçue du service worker :", response);
      }
    });
  } else {
    console.log("Popup non connectée");
  }
}



function crunchyroll(animeCLass) {
  console.log("Crunchyroll");
}


function displayAnimeCarac() {
  let
}








//let video = document.querySelector('video');
//
////console.log(video);
//
//video.addEventListener('play', () => {
//
//});
//// video.duration;
//// video.currentTime;
//
//video.addEventListener('timeupdate', () => {
//  console.log(Math.floor(video.currentTime) );
//});
