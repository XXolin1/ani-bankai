// This script gets injected into any opened page
// whose URL matches the pattern defined in the manifest
// (see "content_script" key).
// Several foreground scripts can be declared
// and injected into the same or different pages.

//console.log('Foreground script running');
//console.log(location.href);

class anime {
  constructor() {
    this.title = "";
    this.episode = "";
    this.link = "";
  }
}

let animeCarac = new anime();


console.log("URL : ", location.hostname, location.href);

switch (location.hostname) {

  case 'vidmoly.to':
    console.log("URL case iframe : ", location.hostname, location.href);
    voiranime(animeCarac);
    break;

  case 'v5.voiranime.com':
    voiranime(animeCarac);
    break;

  case 'www.crunchyroll.com':
    crunchyroll(animeCarac);

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

    console.log("Traduction : ", traduction, "Episode split : ", episodeLink.split("-"), "Title : ", title, "Link split : ", link.split("/"), "Link : ", link, "URL : ", location.hostname, location.href);
  }



  let video = document.querySelector('video');
  console.log("Video : ", video)
  video = document.querySelector('video');
  console.log("URL case iframe : ", location.hostname, location.href);

  if (video != null) {
    console.log("Video : ", video);
    video.addEventListener('play', () => {

    });

    // video.duration;
    // video.currentTime;

    video.addEventListener('timeupdate', () => {
      console.log(Math.floor(video.currentTime));
    });
  }

  console.log("ON PASSE AU SEND MESSAGE");

  // Envoyer un message au service worker
  chrome.runtime.sendMessage(
    { type: "update", data: "Message depuis foreground.js" },
    console.log("Message envoyé au service worker"),
    (response) => {
      if (chrome.runtime.lastError) {
        console.error("Erreur lors de l'envoi du message :", chrome.runtime.lastError);

      } else {
        console.log("Réponse reçue du service worker :", response);

      }
    }
  );



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