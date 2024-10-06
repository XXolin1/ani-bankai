{extends file="views/templates/ani_page.tpl"}


{block name="title"}Ani-bankai{/block}

{block name="script"}ani_page{/block}



{block name="header"}

<header>
    <div class="profile">
        <div class="profile_picture"></div>
        <div class="profile_pseudo">Profile_pseudo</div>
        <div class="profile_badge"></div>
    </div>
    <div class="menu">
        <div class="img"></div>
    </div>
</header>

{/block}

{block name="content"}

<main>
    <article class="left_container">
        <div class="bio">bio</div>

        <div class="left_category">
            <div class="button_left">Last actions</div>
        </div>

        <div class="info_bloc">
            <div class="list_bloc">list_action</div>
            <div class="list_like_info">list_action</div>
            <div class="list_bloc">list_action</div>
        </div>
    </article>


    <article class="right_container">
        <div class="stat">
            <div class="stat_anime_manga">
                <div class="stat_box">seen</div>
                <div class="stat_box">watching</div>
                <div class="stat_box">drop</div>
            </div>

            <div class="stat_anime_manga">
                <div class="stat_box">seen</div>
                <div class="stat_box">watching</div>
                <div class="stat_box">drop</div>
            </div>
        </div>

        <div class="right_category">
            <div class="button_right">Animes - Favoris</div>
            <div class="button_right">Mangas - Favoris</div>
        </div>

        <div class="info_bloc">

            <div class="list_bloc">
                <div class="list_bloc_img"></div>
                <div class="list_bloc_title">

                    <div class="title_bloc">
                        <div class="title"> Titre original : </div>
                        <div class="name_anime" id="original_name">Haikyū!! / ハイキュー!!</div>
                    </div>

                    <div class="title_bloc">
                        <div class="title"> Titre alternatif : </div>
                        <div class="name_anime" id="alternative_name">Haikyuu !! / Haikyû!</div>
                    </div>

                </div>

                <div class="list_bloc_infos">autre</div>
            </div>

            <div class="list_bloc">list_best1</div>
            <div class="list_bloc">list_best1</div>
        </div>
    </article>

    <article class="perso_container">
        <div class="personnalisation">personnalisation</div>
    </article>
</main>

{/block}