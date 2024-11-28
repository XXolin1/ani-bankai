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

function crunchyroll(animeCLass) {
    
}



console.log("URL : ", location.hostname, location.href);

switch (location.hostname) {

  case 'voiranime.com':
    voiranime(anime);
    break;

  case 'crunchyroll.com':
    crunchyroll(anime);
    break;

  default:
    break;
}


let video = document.querySelector('video');

//console.log(video);

video.addEventListener('play', () => {
  
});
// video.duration;
// video.currentTime;

video.addEventListener('timeupdate', () => {
  console.log(Math.floor(video.currentTime) );
});