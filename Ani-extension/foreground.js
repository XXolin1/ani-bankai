// This script gets injected into any opened page
// whose URL matches the pattern defined in the manifest
// (see "content_script" key).
// Several foreground scripts can be declared
// and injected into the same or different pages.

// The ID of the extension we want to talk to.


let editorExtensionId = "olggkeglcmmolkpmnpffffcpcpdlonpk";



class anime {
  constructor() {
    this.name = "";
    this.title = "";
    this.episode = "";
    this.link = "";
    this.traduction = "";
  }
}

let animeCarac = new anime();



//var views = chrome.extension.getViews({ type: "popup" }); juste comme ca

switch (location.hostname) {

  case 'v6.voiranime.com':
  case 'vidmoly.to':
  case '6v254h9v.xyz':
  case 'voe.sx':
  case 'sandratableother.com':
  case 'my.mail.ru':
    console.log("URL case iframe : ", location.hostname, location.href);
    voiranime(animeCarac, () => {
      chrome.runtime.sendMessage({ action: "newAnime", data: animeCarac });
    });
    break;

  case 'www.crunchyroll.com':
  case 'static.crunchyroll.com':
    crunchyroll(animeCarac, location, () => {
      chrome.runtime.sendMessage({ action: "newAnime", data: animeCarac });
    });

    break;

  default:
    break;
}


function getAnimeCarac() {
  console.log("getAnimeCarac");

  let link = location.href;
}


function crunchyroll(animeClass, location, callback) {
  if (location.hostname === 'www.crunchyroll.com') {
    let targetNode = document.getElementById('content');
    let config = { childList: true, subtree: true };

    let observerCallback = function (mutationsList, observer) {
      for (let mutation of mutationsList) {
        if (mutation.type === 'childList') {
          let titleNode = document.querySelector('h1');
          let animenode = document.querySelector('a.show-title-link');
          if (titleNode) {
            const h1 = titleNode.textContent.split(' - ');
            animeClass.episode = h1[0].substring(1);
            animeClass.title = h1[1];
            animeClass.link = location.href;
          }
          if (animenode) {
            animeClass.name = animenode.querySelector("h4").textContent;
          }
          if (titleNode && animenode) {
            callback();
            observer.disconnect();
            break;
          }
        }
      }
    };

    let observer = new MutationObserver(observerCallback);
    observer.observe(targetNode, config);
  }
  else if (location.hostname == 'static.crunchyroll.com') {
    let video = document.querySelector('video');
    video.addEventListener('timeupdate', () => {
      console.log(Math.floor(video.currentTime));
    });
    video.duration;
  }
  else {
    console.log('Host not supported');
  }
}


function voiranime(animeClass, callback) {

  if (location.hostname == 'v6.voiranime.com') {

    let link = location.href;
    let name = link.split("/")[4].split("-").join(" ");
    let episodeLink = link.split("/")[5];
    let episode = episodeLink.split("-").slice(-2, -1)[0];
    let traduction = episodeLink.split("-").pop();

    animeClass.name = name;
    animeClass.episode = episode;
    animeClass.link = link;
    animeClass.traduction = traduction;
    animeClass.title = name + " " + episode + " " + traduction;

    //callback();
    /*
        let iframe = document.querySelector('iframe');
        console.log("iframe : " + iframe);
    
    
        let video = iframe.contentDocument.querySelector('video');
        console.log("Vidéo trouvée :", video);
        console.log("Source de la vidéo :", video ? video.src : "Pas de vidéo trouvée");
    */

    let iframe = document.querySelector('iframe');

    if (iframe) {
      // Envoyer une requête à l'iframe pour demander le temps de la vidéo
      setInterval(() => {
        iframe.contentWindow.postMessage({ action: "getTime" }, "*");
      }, 1000);

      // Écouter les réponses de l'iframe
      window.addEventListener("message", (event) => {
        if (event.data.action === "videoTime") {
          console.log("⏳ Temps actuel de la vidéo :", event.data.time, "secondes");
        }
      });
    } else {
      console.log("❌ Aucune iframe détectée.");
    }


    window.addEventListener("message", (event) => {
      if (event.data.action === "getTime") {
        let video = document.querySelector("video");
        if (video) {
          event.source.postMessage({ action: "videoTime", time: Math.floor(video.currentTime) }, "*");
        }
      }
    });

  }
}


/////////////////////////////////


/*
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
*/