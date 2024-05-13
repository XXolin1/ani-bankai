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

  <link rel="stylesheet" href="assets/bankai_list_template.css">

  <title>Ani-bankai - {block name="title"}default{/block}</title>

  <script src="assets/{block name="script"}{/block}.js" defer></script>



</head>

<body>
    <header>

    {block name="banniere"}{/block}

        <div class="title"></div>


        <section id="popProfil">
            <h1> Mon Profil </h1>


        </section>
    </header>

  {block name="content"}{/block}

    <footer>

        <div id="scrollup"> </div>

    </footer>

</body>

</html>