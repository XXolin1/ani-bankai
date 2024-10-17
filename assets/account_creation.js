

let error__close = document.getElementById("error__close");
error__close.addEventListener("click", function() {
    error.classList.remove("error-show");
    error.classList.add("error-hide");
});

let idForm = document.getElementById("formCreation")

// Test event listener
//idForm.addEventListener("click", validateMail);
//idForm.addEventListener("click", passwordCheck);
// Fin test event listener


function errorPopUp(message = "") {
    let error = document.getElementById("error");
    if (true) {
        let error_message = document.getElementById("error__title");
        console.log("mais frere")
        error.classList.remove("error-hide");
        error.classList.add("error-show");
        error_message.innerHTML = message;
    } 
}

function validateMail() {
    let email = document.getElementById('email');
    let RegMail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/;
    let validation = RegMail.test(email.value)

    //errorPopUp("Veuillez entrer une adresse mail valide !!");

    if (validation) {
        email.style.border = "none";
        return true;
    }

    else {
        email.style.borderStyle = "solid";
        email.style.borderWidth = "1px";
        email.style.borderColor = "red";
        return false
    };
}

// check pseudo

function checkPseudo() {
    let pseudo = document.getElementById("pseudo").value;
    if (pseudo == "") {
        errorPopUp("Veuillez entrez un pseudo !!")
    }
}


// check password

function passwordCheck() {

    let password = document.getElementById("password");
    let password1 = document.getElementById("password1");


    if (password.value != "") {
        if (password.value == password1.value) {
            return true;
        }
        else {
            errorPopUp("Les mots de passes ne correspondent pas !!");
            return false;
        }
    }
    password.style.borderStyle = "solid";
    password.style.borderWidth = "1px";
    password.style.borderColor = "red";
    errorPopUp("Mot de passe requis !!");
    return false;
}

let submit = document.getElementById("submit");
submit.addEventListener("click", sendCreation);

function sendCreation() {
    validateMail();
    passwordCheck();
    checkPseudo();
}


document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector("form");

    form.addEventListener("submit", function(event) {
        event.preventDefault(); // Empêche l'envoi du formulaire par défaut

        const pseudo = form.querySelector("input[type='text']").value;
        const email = form.querySelector("input[type='email']").value;
        const age = form.querySelector("input[type='number']").value;
        const password = form.querySelector("input[type='password']").value;
        alert("test");

        // Vous pouvez maintenant utiliser les valeurs d'email et de mot de passe pour effectuer des actions, comme l'envoi à un serveur via une requête AJAX, par exemple
        console.log("login:", pseudo);
        console.log("email:", email);
        console.log("age:", age);
        console.log("password:", password);
        //alert(login, password);
        accountCreation(pseudo, password, email, age);
    });
});


function accountCreation(pseudo, password, email, age) {
    try {
        alert("ok pour le debut");
        fetch("/ani-bankai/api/creation", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body : JSON.stringify({
                pseudo: pseudo, 
                password: password,
                email: email,
                age: age
            })
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`Erreur: ${response.status}`);
                }
                return response.text(); // Retourne la promesse du texte de la réponse
            })
            /*
            .then(text => {
                console.log(text); // Affiche le texte reçu de la réponse
                
                if (text === "true") {
                    console.log("mais je crois que ca marche !!");
                    window.location.replace("/accueil");
                }
                else {
                    console.log("La réponse n'est pas true.");
                }
            })
                */

            .catch(error => {
                console.log("Erreur:", error);
                //window.location.replace("http://localhost/Projet/compte.html");
            });

    } catch (error) {
        console.log("Test d'erreur:", error);
        
    }
}