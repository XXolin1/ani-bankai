<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Ani-bankai, votre site d'anime multi-fonctions">
  {* <link rel="stylesheet" href="/assets/{block name="css"}{/block}.css"> *}

  <link rel="preload" href="/assets/{block name="css"}{/block}.css" as="style"
    onload="this.onload=null;this.rel='stylesheet'">
    
  <noscript>
    <link rel="stylesheet" href="/assets/{block name="css"}{/block}.css">
  </noscript>

  <link rel="stylesheet" href="/assets/main_template.css">

  <title>Ani-bankai - {block name="title"}default{/block}</title>

  <script src="/assets/{block name="script"}{/block}.js" defer></script>

  <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
  <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">

  <meta name="msapplication-TileColor" content="#2d89ef">
  <meta name="theme-color" content="#ffffff">


</head>

<body>
    <header>
        <nav>
            <a class="button"> Accueil</a>
            <a href="nouveauté.html" class="button"> Nouveauté</a>
            <a href="bankai-list.html" class="button"> Bankai-list</a>
            <a href="ani-page.html" class="button"> ani-page</a>
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