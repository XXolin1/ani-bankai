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
  }
}

let animeCarac = new anime();



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

}
