// This script gets injected into any opened page
// whose URL matches the pattern defined in the manifest
// (see "content_script" key).
// Several foreground scripts can be declared
// and injected into the same or different pages.

//console.log('Foreground script running');
//console.log(location.href);



let video = document.querySelector('video');

//console.log(video);

video.addEventListener('play', () => {
  
});
// video.duration;
// video.currentTime;

video.addEventListener('timeupdate', () => {
  console.log(Math.floor(video.currentTime) );
});
