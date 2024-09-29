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

    <!-- <div class="menu-pop"></div> -->


    <div class="banniere"></div>


</header>

{/block}

{block name="content"}

<main>
        <!-- Colonne de droite -->

    <div class="leftColumn">
        <article class="ani_bio"> " bio " </article>
        <article class="ani_favori"> " favori-anime-manga " </article>
    </div>
    
    <div class="rightColumn">
        <div class="stats">
        <article class="ani_anime_view"> 
            <div class="viewed">
                <div class="info_view_text"> anime viewed </div>                  <!--test des valeurs-->
                <div class="info_view_value"> 150 </div>        <!--test des valeurs-->
            </div>

            <div class="in_progress">
                <div class="info_view_text"> anime in progress </div>                  <!--test des valeurs-->
                <div class="info_view_value"> 150 </div>        <!--test des valeurs-->
            </div>

            <div class="droped">
                <div class="info_view_text"> anime droped </div>                  <!--test des valeurs-->
                <div class="info_view_value"> 25 </div>        <!--test des valeurs-->
            </div>

            <div class="ani_view_deco"></div>
        </article>  

        <!---->

        <!-- Partie manga -->

        <article class="ani_manga_view"> 
            <div class="viewed">
                <div class="info_view_text"> manga viewed </div>                  <!--test des valeurs-->
                <div class="info_view_value"> 150 </div>        <!--test des valeurs-->
            </div>

            <div class="in_progress">
                <div class="info_view_text"> manga in progress </div>                  <!--test des valeurs-->
                <div class="info_view_value"> 150 </div>        <!--test des valeurs-->
            </div>

            <div class="droped">
                <div class="info_view_text"> manga droped </div>                  <!--test des valeurs-->
                <div class="info_view_value"> 150 </div>        <!--test des valeurs-->
            </div>

            <div class="ani_view_deco"></div>
        </article>

        <!---->
    </div>


        <article class="ani_infos"> " last infos " </article>
    </div>

<!--<div class="crayon" id="crayon"> </div>-->

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