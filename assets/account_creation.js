
// valider le code postal

function validateMail() {
    let mail = document.getElementById('mail');
    let RegMail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/;
    let validation = RegMail.test(codePostal.value)

    if (validation) {
        mail.style.border = "none";
        return true;
    }

    else {

        mail.style.borderStyle = "solid";
        mail.style.borderWidth = "1px";
        mail.style.borderColor = "red";
        return false
    };
}

// check pseudo

function checkPseudo() {
    let pseudo = document.getElementById("pseudo").value;
    if (pseudo == "") {
        alert("ta pas de pseudo mec?")
    }
}


// check mail

function mailCheck() {
    let email = document.getElementById("email").value;
    let email1 = document.getElementById("email1").value;

    if (email != "") {
        if (email == email1) {
            alert("OE PAPAPAPA (mail)");
            return true;
        }
        else {
            alert("ta grand mere le mail c pas le mm wsh");
            return false;
        }
    }
    alert("met un mail connard");
    return false;
}

// check password

function passwordCheck() {

    let password = document.getElementById("password").value;
    let password1 = document.getElementById("password1").value;

    if (password != "") {
        if (password == password1) {
            alert("OE PAPAPAPA");
            return true;
        }
        else {
            alert("ta grand mere le mdp c pas le mm wsh");
            return false;
        }
    }
    alert("met un mdp connard");
    return false;
}


function sendCreation() {
    passwordCheck();
    mailCheck();
    checkPseudo();
}




let send = document.getElementById("formCreation");
send.addEventListener('submit', sendCreation);


let email = document.getElementById('email');
let email_confirmation = document.getElementById('email1');

let password = document.getElementById('password');
let password_confirmation = document.getElementById('password1');


function validateEmail() {
    console.log("test");
    console.log(email.value);
    console.log(email_confirmation.value);
    if (email.value != email_confirmation.value) {
        console.log("jsuisla");
        email_confirmation.setCustomValidity("Les emails ne correspondent pas");
    } else {
        email_confirmation.setCustomValidity('');
    }
}

function validatePassword() {
    if (password.value != password_confirmation.value) {
        password_confirmation.setCustomValidity("Les mots de passe ne correspondent pas");
    } else {
        password_confirmation.setCustomValidity('');
    }
}


document.addEventListener("click", validateEmail);