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


function voiranime(animeClass) {
  var player = document.querySelector('iframe[src*="streaming.php"]');
  if (player) {
    var src = player.src;
    var id = src.match(/id=(\d+)/)[1];
    var url = 'https://voiranime.com/streaming.php?id=' + id;
    player.src = url;
  }
  animeClass.title = document.querySelector('h1').textContent;
}
//

function crunchyroll(animeClass,host,callback) {
  // Find the title of the anime
  if (host == 'www.crunchyroll.com') {
    // Trouver le conteneur à observer
    let targetNode = document.getElementById('content'); 
    // Configuration de l'observateur
    let config = { childList: true, subtree: true };

    // Callback pour gérer les mutations
    let observerCallback = function(mutationsList, observer) {
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
      console.log(Math.floor(video.currentTime) );
    });
  }
  else {
    console.log('Host not supported');
  }

}



console.log("URL : ", location.hostname, location.href);

switch (location.hostname) {

  case 'voiranime.com':
    voiranime(anime);
    break;

  case 'www.crunchyroll.com':
  case 'static.crunchyroll.com':
    crunchyroll(anime,location.hostname, () => {
      // callback funct to save data
    });

    break;

  default:
    break;
}
