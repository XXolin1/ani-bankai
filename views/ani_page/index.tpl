{extends file="views/templates/bankai_list.tpl"}


{block name="title"}Ani-bankai{/block}

{block name="script"}bankai_list{/block}

{block name="banniere"}

        <div class="banniere"></div>

        <nav>
            <a href="accueil" class="button"> Accueil</a>
            <a href="nouveaute" class="button"> Nouveautés</a>
            <a href="bankai_list" class="button"> Bankai-list</a>
            <a href="random_search" class="button"> Trouver mon anime</a>
            <a href="ani_page" class="button"> ani-page</a>
            <div id="profil"> </div>
        </nav>
{/block}

{block name="content"}

       <main>
       
    
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


        <h2>Bankai-list</h2>
        <p>Bankai-list est un site qui vous permet de retrouver vos animes, mangas et OST préférés.</p>
        <p>Vous pouvez également vous connecter pour ajouter vos propres animes, mangas et OST.</p>
       </main>

{/block}