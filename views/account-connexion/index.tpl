{extends file="views/templates/account.tpl"}

{block name="css"}account_connexion.css{/block}

{block name="script"}account_connexion.js{/block}


{block name="title"}Ani-bankai{/block}
{block name="content"}

<form>

        <h1>Se connecter</h1>

        <p class="choose-email">Veuillez entrer vos identifiants :</p>

        <div class="inputs">
            <input id="mailConnexion" type="email" placeholder="Email" />
            <input type="password" placeholder="Mot de passe">
        </div>

        <p class="inscription">Je n'ai pas de <span>compte</span>. Je m'en <span> <a class="deco-cree" href="account-creation.html"> crée</a> </span> un.</p>
        <div align="center">
            <button type="submit">Se connecter</button>
        </div>
    </form>
{/block}