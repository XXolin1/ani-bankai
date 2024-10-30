

let error_close = document.getElementById("error__close");
//error__close.addEventListener("click", function() {
//    error.classList.remove("error-show");
//    error.classList.add("error-hide");
//});

let idForm = document.getElementById("formCreation")

// Test event listener
//idForm.addEventListener("click", validateMail);
//idForm.addEventListener("click", passwordCheck);
// Fin test event listener

error_close.addEventListener("click", errorPopUpClose);

function errorPopUpClose() {
    error.classList.remove("error-show");
    error.classList.add("error-hide");
}


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
                console.log("ici");
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
    alert("bah non!!")
}

// check pseudo

function checkPseudo() {
    let pseudo = document.getElementById("pseudo");
    if (pseudo.value == "") {
        errorPopUp("Veuillez entrez un pseudo !!")
        pseudo.style.borderStyle = "solid";
        pseudo.style.borderWidth = "1px";
        pseudo.style.borderColor = "red";
        return false;
    }
    pseudo.style.border = "none";
    return true;
}

function checkAge() {
    let age = document.getElementById("age");
    if (age.value == "") {
        errorPopUp("Veuillez entrez votre age !!")
        age.style.borderStyle = "solid";
        age.style.borderWidth = "1px";
        age.style.borderColor = "red";
        return false;
    }
    age.style.border = "none";
    return true;
}


// check password

function passwordCheck() {

    let password = document.getElementById("password");
    let password1 = document.getElementById("password1");


    if (password.value != "") {
        if (password.value == password1.value) {
            password.style.border = "none";
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


document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");

    form.addEventListener("submit", async function (event) {
        event.preventDefault(); // Empêche l'envoi du formulaire par défaut

        const pseudo = form.querySelector("input[type='text']").value;
        const email = form.querySelector("input[type='email']").value;
        const age = form.querySelector("input[type='number']").value;
        const password = form.querySelector("input[type='password']").value;

        console.log("test : ", await sendCreation());

        if (await sendCreation()) {
            await accountCreation(pseudo, password, email, age);
        }
        return;
    });
});


async function accountCreation(pseudo, password, email, age) {
    try {
        fetch("/ani-bankai/api/accountCreation/creation", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
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

            .catch(error => {
                console.log("Erreur:", error);
                //window.location.replace("http://localhost/Projet/compte.html");
            });

    } catch (error) {
        console.log("Test d'erreur:", error);

    }
}

async function sendCreation() {
    console.log(await validateMail());
    if (checkPseudo() && checkAge() && await validateMail() && passwordCheck()) {
        return true;
    }
    else {
        return false;
    }
}