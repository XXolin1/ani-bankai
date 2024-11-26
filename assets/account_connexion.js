
let error_close = document.getElementById("error__close");
let idForm = document.getElementById("formCreation")

error_close.addEventListener("click", errorPopUpClose);

function errorPopUpClose() {
    error.classList.remove("error-show");
    error.classList.add("error-hide");
}

errorPopUp("test");


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

async function validateMail() {
    let email = document.getElementById('email');
    let RegMail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/;
    let validation = RegMail.test(email.value);
    let finalResponse = false;

    if (validation) {
        email.style.border = "none";

        let response = await fetch("/ani-bankai/api/accountCreation/email?email=" + email.value)
            let data = await response.json();
            console.log("data : ", data);
            console.log("data 0 ou 1 : " +  data[0].email_exists);
            if (data[0].email_exists == 1) { // check si l'email existe déjà
                errorPopUp("Adresse mail déjà utilisée !!")
                email.style.borderStyle = "solid";
                email.style.borderWidth = "1px";
                email.style.borderColor = "red";
                return false;
            }
            else {
                email.style.border = "none";
                return true;
            }
        }

    else {
        errorPopUp("Veuillez entrez une adresse mail valide !!")
        email.style.borderStyle = "solid";
        email.style.borderWidth = "1px";
        email.style.borderColor = "red";
        return false
    };
}


function passwordCheck() {
    let password = document.getElementById("password");
    if (password == "") {
        errorPopUp("Veuillez entrez un mot de passe !!")
        password.style.borderStyle = "solid";
        password.style.borderWidth = "1px";
        password.style.borderColor = "red";
        return false;
    }
}


document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");

    form.addEventListener("submit", async function (event) {
        event.preventDefault(); // Empêche l'envoi du formulaire par défaut

        const email = form.querySelector("input[type='email']").value;
        const password = form.querySelector("input[type='password']").value;

        if (await sendConnexion()) {
            await accountConnexion(email, password);
        }
        return;
    });
});


async function accountConnexion(email, password) {
    try {
        fetch("/ani-bankai/api/...", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                email: email,
                password: password,
            })
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`Erreur: ${response.status}`);
                }
                return response.text(); // Retourne la promesse du texte de la réponse
            })

            .catch(error => {
                console.log("Erreur:", error);
                //window.location.replace("http://localhost/Projet/compte.html");
            });

    } catch (error) {
        console.log("Test d'erreur:", error);

    }
}

async function sendConnexion() {
    if (/*await validateMail() && */passwordCheck()) {
        return true;
    }
    else {
        return false;
    }
}




