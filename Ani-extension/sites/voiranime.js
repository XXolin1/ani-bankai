export function voiranime(animeClass) {
  var player = document.querySelector('iframe[src*="streaming.php"]');
  if (player) {
    var src = player.src;
    var id = src.match(/id=(\d+)/)[1];
    var url = 'https://voiranime.com/streaming.php?id=' + id;
    player.src = url;
  }
  //animeCLass.title = document.querySelector('h1').textContent;
}
