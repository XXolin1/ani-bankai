// This script gets injected into any opened page
// whose URL matches the pattern defined in the manifest
// (see "content_script" key).
// Several foreground scripts can be declared
// and injected into the same or different pages.

//console.log('Foreground script running');
//console.log(location.href);

// The ID of the extension we want to talk to.
var editorExtensionId = "hiabjpjjljjfjjeinealgdmodpljpifm";

class anime {
  constructor() {
    this.name = "";
    this.title = "";
    this.episode = "";
    this.link = "";
  }
}

let animeCarac = new anime();

console.log("URL : ", location.hostname, location.href);

//var views = chrome.extension.getViews({ type: "popup" }); juste comme ca

switch (location.hostname) {

  case 'v5.voiranime.com':
  case 'vidmoly.to':
  case '6v254h9v.xyz':
  case 'voe.sx':
  case 'sandratableother.com':
  case 'my.mail.ru':
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

    video.addEventListener('timeupdate', () => {
      console.log(Math.floor(video.currentTime));

      chrome.runtime.sendMessage(editorExtensionId, { type: "timecode", data: Math.floor(video.currentTime) }, (response) => {
        if (chrome.runtime.lastError) {
          console.error("Erreur lors de l'envoi du message :", chrome.runtime.lastError);
        } else {
          console.log("[Foreground] Réponse reçue du service worker :", response);
        }
      });
    });
  }


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
}

function displayAnimeCarac() {
  let
}