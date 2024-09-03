{extends file="views/templates/ani_page.tpl"}


{block name="title"}Ani-bankai{/block}

{block name="script"}ani_page{/block}



{block name="header"}

<header>
    <section>
        <div class="profile_picture"></div>
        <div id="name_profile"> XXolin </div>
    </section>

    <div id="menu" class="menu"></div>

    <div class="menu-pop"></div>


    <div class="banniere"></div>


</header>

{/block}

{block name="content"}

<main>

    <article class="ani_bio"> " bio " </article>
    <article class="ani_infos"> " last infos " </article>
    <article class="ani_anime_view"> " anime view " </article>
    <article class="ani_manga_view"> " manga view " </article>
    <article class="ani_favori"> " favori-anime-manga " </article>


    <div class="crayon" id="crayon">

    </div>

    <div class="input" id="modif_menu">
        <button class="value">
            Public profile
        </button>
        <button class="value">
            Account
        </button>
        <button class="value">
            Appearance
        </button>
        <button class="value">
            Accessibility
        </button>
        <button class="value">
            Notifications
        </button>
    </div>
    </div>

</main>

{/block}