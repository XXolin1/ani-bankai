// data management
let linkanime;
document.addEventListener("DOMContentLoaded", () => {
    chrome.storage.local.get("popupData", (result) => {
        if (result.popupData) {
            document.getElementById("anime-name").innerText = result.popupData.name;
            document.getElementById("episode-title").innerText = result.popupData.title;
            document.getElementById("anime-episode").innerText = "Ep: " + result.popupData.episode + " - ";
            linkanime = result.popupData.link;
        }
    });
    document.getElementById("goto-btn").addEventListener("click", function () {
        if (linkanime) {
            chrome.tabs.create({ url: linkanime });
        }
    });
});

let title = document.getElementById('title');
let time = document.getElementById('time');

// second to m:s
function secondsToms(d) {
    d = Number(d);
    let m = Math.floor(d % 3600 / 60);
    let s = Math.floor(d % 3600 % 60);
    return m +":"+s;
}

// update time
function updateTime(t,tempsEp) {
    let prog = t/tempsEp*100;
    let bar = document.getElementById('bar');
    bar.value = prog;
    bar.textContent = `${prog}%`;
}

function VideoMode(){
    // display none everything
    let base = document.getElementById('base');
    base.style.display = "none";
    let vidmod = document.getElementById('VidMod');
    vidmod.style.display = "block";
}


// -----------------------------------------------------------


// notification status 

const notifications = document.querySelectorAll('.notif');

// Ajoutez un événement à chaque bouton
notifications.forEach(notification => {
    notification.addEventListener('click', function () {
        // Vérifiez et changez le style uniquement pour le bouton cliqué
        if (this.style.backgroundImage.includes("bouton-notifications-colored.png")) {
            this.style.backgroundImage = "url('/images-extension/bouton-notifications.png')";
        } else {
            this.style.backgroundImage = "url('/images-extension/bouton-notifications-colored.png')";
        }
    });
});


// theme
let theme = document.getElementById('combox-back');

theme.addEventListener("change", () =>{
    switch (theme.value) {
        
        case "1":
            document.body.style.background = "linear-gradient(to bottom right, #FFED68 0%, #38D4F8 100%)";
            break;
        case "2":
            document.body.style.background = "linear-gradient(to bottom right, #FF93F8 0%, #52BDFF 100%)";
            break;
        case "3":
            document.body.style.background = "linear-gradient(to bottom right, #FF4A4A 0%, #0CFE71 100%)";
            break;
        case "4":
            document.body.style.background = "linear-gradient(to bottom right, #36E43C 0%, #E2FF3E 100%)";
            break;
        case "5":
            document.body.style.background = "linear-gradient(to bottom right, #294DFF 0%, #FE951E 100%)";
            break;
        default:
            document.body.style.background = "linear-gradient(to bottom right, #FFED68 0%, #38D4F8 100%)";
    }


});



