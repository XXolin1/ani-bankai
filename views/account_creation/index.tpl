{extends file="views/templates/account.tpl"}

{block name="script"}account_creation{/block}


{block name="title"}Ani-bankai{/block}
{block name="content"}

    <form id="formCreation">

        <h1>Créer un compte</h1>

        <p class="choose-email">Veuillez entrer vos informations :</p>

        <div class="inputs">
            <input id="pseudo" type="pseudo" placeholder="Pseudo">
            <input id="age" type="number" placeholder="Veuillez entrer votre age">
            <input id="email" type="email" placeholder="Email" />
            <input id="email1" type="email" placeholder="Confirmation Email" />
            <input id="password" type="password" placeholder="Mot de passe">
            <input id="password1" type="password" placeholder="Confirmation Mot de passe">
        </div>

       
        <div align="center">
            <button type="submit">Se connecter</button>
        </div>
    </form>

{/block}