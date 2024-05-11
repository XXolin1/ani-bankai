<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Ani-bankai, votre site d'anime multi-fonctions">
  {* <link rel="stylesheet" href="assets/{block name="css"}{/block}.css"> *}

  <link rel="preload" href="assets/{block name="css"}{/block}.css" as="style"
    onload="this.onload=null;this.rel='stylesheet'">
    
  <noscript>
    <link rel="stylesheet" href="assets/{block name="css"}{/block}.css">
  </noscript>

  <link rel="stylesheet" href="assets/main_template.css">

  <title>Ani-bankai - {block name="title"}default{/block}</title>

  <script src="assets/{block name="script"}{/block}.js" defer></script>



</head>

<body>
    <header>
        <nav>
            <a href="accueil" class="button"> Accueil</a>
            <a href="nouveaute" class="button"> Nouveautés</a>
            <a href="bankai_list" class="button"> Bankai-list</a>
            <a href="random_search" class="button"> Trouver mon anime</a>
            <a href="ani_page" class="button"> ani-page</a>
            <div id="profil"> </div>
        </nav>


        <div class="title"></div>


        <section id="popProfil">
            <h1> Mon Profil </h1>

            <p>wsh bi1 c en dev ici</p>
            <a href="account-connexion.html"> Connexion </a>

        </section>
    </header>

  {block name="content"}{/block}

    <footer>

        <div id="scrollup"> </div>

    </footer>

</body>

</html>